/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Product;
import Models.ProductSale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author ManhPhuc
 */
public class ProductSaleDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    public static ProductSaleDAO INSTANCE = new ProductSaleDAO();
    private ProductSale pro;
    private List<ProductSale> prosale;

    public List<ProductSale> getProsale() {
        return prosale;
    }

    public void setProsale(List<ProductSale> prosale) {
        this.prosale = prosale;
    }

    public ProductSaleDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public ProductSale getPro() {
        return pro;
    }

    public void setPro(ProductSale pro) {
        this.pro = pro;
    }

    public void getIdSaleEvent(String startdate, String enddate, String name) {
        String sql = "select se.*, p.id,p.price, sa.[percent], "
                + "p.img_default, p.price_sale from SaleEvent se \n"
                + "join Sale sa on se.id = sa.Saleevent_id\n"
                + "join ProductInfor p on p.id = sa.Proinfo_id\n"
                + "where se.startdate = ? and se.enddate = ? and se.[name] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, startdate);
            ps.setString(2, enddate);
            ps.setString(3, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                pro = new ProductSale(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getFloat(7),
                        rs.getString(8),
                        rs.getFloat(9)
                );
            }
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public ProductSale getProductSaleByProinfoId(int proid) {
        String sql = "SELECT se.*, p.id, p.price, sa.[percent],p.img_default, p.price_sale\n"
                + "FROM SaleEvent se \n"
                + "JOIN Sale sa ON se.id = sa.Saleevent_id\n"
                + "JOIN ProductInfor p ON p.id = sa.Proinfo_id\n"
                + "WHERE sa.id = (\n"
                + "    SELECT MAX(sa.id)\n"
                + "    FROM Sale sa\n"
                + "    WHERE sa.Proinfo_id = ?\n"
                + ")";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, proid);
            rs = ps.executeQuery();
            while (rs.next()) {
                pro = new ProductSale(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getFloat(7),
                        rs.getString(8),
                        rs.getFloat(9)
                );
            }
            return pro;
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
        return null;
    }

    public ProductSale getProductSaleBySaleEventId(int saleeventid) {
        String sql = "SELECT se.*, p.id, p.price, sa.[percent],p.img_default, p.price_sale\n"
                + "FROM SaleEvent se \n"
                + "JOIN Sale sa ON se.id = sa.Saleevent_id\n"
                + "JOIN ProductInfor p ON p.id = sa.Proinfo_id\n"
                + "WHERE se.id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, saleeventid);
            rs = ps.executeQuery();
            while (rs.next()) {
                pro = new ProductSale(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getFloat(7),
                        rs.getString(8),
                        rs.getFloat(9)
                );
            }
            return pro;
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
        return null;
    }

    public List<ProductSale> listAllProductSale() {
        prosale = new Vector<ProductSale>();
        String sql = "SELECT se.*, p.id, p.price, sa.[percent], p.img_default, p.price_sale\n"
                + "FROM SaleEvent se \n"
                + "JOIN Sale sa ON se.id = sa.Saleevent_id\n"
                + "JOIN ProductInfor p ON p.id = sa.Proinfo_id\n";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                prosale.add(new ProductSale(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getFloat(7),
                        rs.getString(8),
                        rs.getFloat(9)
                ));
            }
            return prosale;
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
        return null;
    }

    public static void main(String[] args) {
//        ProductSaleDAO.INSTANCE.listAllProductSale();
        ProductSaleDAO.INSTANCE.listAllProductSale();
        System.out.println(ProductSaleDAO.INSTANCE.listAllProductSale().toString());
    }
}
