package DAL;

import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class ProductDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private List<Product> listProduct;
    public static ProductDAO INSTANCE = new ProductDAO();


    public List<Product> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<Product> listProduct) {
        this.listProduct = listProduct;
    }


    public ProductDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }
    public List<Product> getAllProduct() {
        listProduct = new Vector<Product>();
        String sql = "SELECT p.*\n"
                + "FROM Products p\n"
                + "JOIN (\n"
                + "    SELECT MIN(p.id) AS min_id, p.name\n"
                + "    FROM Products p\n"
                + "    JOIN Style s ON p.style_id = s.id\n"
                + "    JOIN Category c ON s.cate_id = c.id\n"
                + "    GROUP BY p.name\n"
                + ") min_products ON p.id = min_products.min_id\n"
                + "ORDER BY p.id DESC;";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getFloat(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listProduct;
    }
    public List<Product> getProductByCid(String cid) {
        listProduct = new Vector<Product>();
        String sql = "SELECT p.*\n"
                + "FROM Products p\n"
                + "JOIN (\n"
                + "    SELECT MIN(p.id) AS min_id, p.name\n"
                + "    FROM Products p\n"
                + "    JOIN Style s ON p.style_id = s.id\n"
                + "    JOIN Category c ON s.cate_id = c.id\n"
                + "    WHERE c.id = ?\n"
                + "    GROUP BY p.name\n"
                + ") min_products ON p.id = min_products.min_id\n"
                + "ORDER BY p.id DESC;";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getFloat(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listProduct;
    }

    public List<Product> getTop6NewArrival() {
        listProduct = new Vector<Product>();
        String sql = "SELECT TOP 6 p.*\n"
                + "FROM [dbo].[Products] p\n"
                + "JOIN (\n"
                + "    SELECT MIN(p.id) AS min_id, p.name\n"
                + "    FROM [dbo].[Products] p\n"
                + "    JOIN [dbo].[Style] s ON p.style_id = s.id\n"
                + "    JOIN [dbo].[Category] c ON s.cate_id = c.id\n"
                + "    GROUP BY p.name\n"
                + ") min_products ON p.id = min_products.min_id\n"
                + "ORDER BY p.id DESC;";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getFloat(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listProduct;
    }

}
