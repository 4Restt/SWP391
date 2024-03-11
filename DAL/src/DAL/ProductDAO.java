package DAL;

import Models.Cart;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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

    public void Search(String sql, String txt, int size) {
        listProduct = new Vector<Product>();
        try {
            ps = con.prepareStatement(sql);
            for (int i = 1; i <= size; i++) {
                ps.setString(i, txt);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(7),
                        rs.getString(8)
                ));

            }
        } catch (Exception e) {
        }

    }

    public List<Product> getAllProduct() {
        listProduct = new Vector<Product>();
        String sql = "WITH RankedProducts AS (\n"
                + "    SELECT P.product_info_id, P.size,  P.color, P.name AS product_name, P.quantity, PI.price, PI.img_default,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY \n"
                + "            CASE \n"
                + "                WHEN P.size = 'S' THEN 0 \n"
                + "                WHEN P.size = 'M' THEN 1 \n"
                + "                WHEN P.size = 'L' THEN 2 \n"
                + "                WHEN P.size = 'XL' THEN 3 \n"
                + "                ELSE 4\n"
                + "            END\n"
                + "        ) AS rn\n"
                + "    FROM  Product P\n"
                + "    JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + ")\n"
                + "SELECT product_info_id, size, color, product_name, quantity, price, img_default\n"
                + "FROM RankedProducts\n"
                + "WHERE rn = 1\n"
                + "ORDER BY product_info_id DESC";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listProduct;
    }

    public void SearchFilter(String[] style, String cateId, String sql) {
        listProduct = new Vector<Product>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cateId);
            for (int i = 0; i < style.length; i++) {
                ps.setString(i + 2, style[i]);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();

        }
    }

    public void SearchFilter1(String cateId, String sql) {
        listProduct = new Vector<Product>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cateId);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();

        }
    }

    public void SearchFilter2(String sql) {
        listProduct = new Vector<Product>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();

        }
    }

    public List<Product> getProductByCid(String cid) {
        listProduct = new Vector<Product>();
        String sql = "WITH RankedProducts AS (\n"
                + "    SELECT P.product_info_id, P.size,  P.color, P.name AS product_name, P.quantity, PI.price, PI.img_default,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY \n"
                + "            CASE \n"
                + "                WHEN P.size = 'S' THEN 0 \n"
                + "                WHEN P.size = 'M' THEN 1 \n"
                + "                WHEN P.size = 'L' THEN 2 \n"
                + "                WHEN P.size = 'XL' THEN 3 \n"
                + "                ELSE 4 \n"
                + "            END\n"
                + "        ) AS rn\n"
                + "    FROM  Product P\n"
                + "    JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "    JOIN Style S ON PI.style_id = S.id\n"
                + "    JOIN Category C ON S.cate_id = C.id\n"
                + "    WHERE C.id = ? \n"
                + ")\n"
                + "SELECT product_info_id, size, color, product_name, quantity, price, img_default\n"
                + "FROM RankedProducts\n"
                + "WHERE rn = 1"
                + "ORDER BY product_info_id DESC";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listProduct;
    }

    public List<Product> getTop6NewArrival() {
        listProduct = new Vector<Product>();
        String sql = "WITH RankedProducts AS (\n"
                + "    SELECT P.product_info_id, P.size,  P.color, P.name AS product_name, P.quantity, PI.price, PI.img_default,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY \n"
                + "            CASE \n"
                + "                WHEN P.size = 'S' THEN 0 \n"
                + "                WHEN P.size = 'M' THEN 1 \n"
                + "                WHEN P.size = 'L' THEN 2 \n"
                + "                WHEN P.size = 'XL' THEN 3 \n"
                + "                ELSE 4 \n"
                + "            END\n"
                + "        ) AS rn\n"
                + "    FROM  Product P\n"
                + "    JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "    JOIN Style S ON PI.style_id = S.id\n"
                + "    JOIN Category C ON S.cate_id = C.id\n"
                + ")\n"
                + "SELECT TOP 6 product_info_id, size, color, product_name, quantity, price, img_default\n"
                + "FROM RankedProducts\n"
                + "WHERE rn = 1\n"
                + "ORDER BY product_info_id DESC";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listProduct;
    }

    public List<String> getProductInfoImage(String productInfoId, String color) {
        List<String> listImgPath = new Vector<String>();
        String sql = "SELECT path\n"
                + "FROM (\n"
                + "    SELECT DISTINCT I.path\n"
                + "    FROM Image AS I\n"
                + "    INNER JOIN Product AS P ON I.product_info_id = P.product_info_id\n"
                + "    WHERE P.product_info_id = ? AND P.color = ?\n"
                + ") AS Subquery\n"
                + "ORDER BY (SELECT MIN(I.id) FROM Image AS I WHERE I.path = Subquery.path);";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, productInfoId);
            ps.setString(2, color);
            rs = ps.executeQuery();
            while (rs.next()) {
                listImgPath.add(rs.getString("path"));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listImgPath;
    }

    public List<String> getProductInfoColor(String productInfoId, String size) {
        List<String> listColor = new Vector<String>();
        String sql = "SELECT color FROM Product WHERE product_info_id = ? AND size = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, productInfoId);
            ps.setString(2, size);
            rs = ps.executeQuery();
            while (rs.next()) {
                listColor.add(rs.getString("color"));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listColor;
    }

    public List<String> getProductInfoSize(String productInfoId, String color) {
        List<String> listSize = new Vector<String>();
        String sql = "SELECT size FROM Product WHERE product_info_id = ? AND color = ?\n"
                + "ORDER BY \n"
                + "            CASE \n"
                + "                WHEN size = 'S' THEN 0 \n"
                + "                WHEN size = 'M' THEN 1 \n"
                + "                WHEN size = 'L' THEN 2 \n"
                + "                WHEN size = 'XL' THEN 3  \n"
                + "            END";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, productInfoId);
            ps.setString(2, color);
            rs = ps.executeQuery();
            while (rs.next()) {
                listSize.add(rs.getString("size"));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return listSize;
    }

    public Product getProductByPSC(String product_info_id, String size, String color) {
        String sql = "SELECT  P.product_info_id, P.size,  P.color, P.name, P.quantity, PI.price, PI.img_default\n"
                + "FROM Product P\n"
                + "JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "WHERE product_info_id = ? AND size = ? AND color= ?\n"
                + "ORDER BY product_info_id DESC;";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, product_info_id);
            ps.setString(2, size);
            ps.setString(3, color);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
        return null;
    }

    public List<Cart> getCartProduct(ArrayList<Cart> cartList) {
        List<Cart> productsCart = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String sql = "WITH RankedProducts AS (\n"
                            + "            SELECT P.product_info_id as productInfoId, P.size,  P.color, P.name, P.quantity, PI.price, PI.img_default as imgDefault,\n"
                            + "            ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY \n"
                            + "            CASE \n"
                            + "                             WHEN P.size = 'S' THEN 0 \n"
                            + "                                WHEN P.size = 'M' THEN 1 \n"
                            + "                               WHEN P.size = 'L' THEN 2 \n"
                            + "                                WHEN P.size = 'XL' THEN 3 \n"
                            + "                                ELSE 4\n"
                            + "                            END\n"
                            + "                        ) AS rn\n"
                            + "                    FROM  Product P\n"
                            + "                   JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                            + "                )\n"
                            + "                SELECT productInfoId, size, color, name , quantity, price, imgDefault\n"
                            + "                FROM RankedProducts\n"
                            + "                WHERE productInfoId = ? and size = ? and color = ? ";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, item.getProductInfoId());
                    ps.setString(2, item.getSize());
                    ps.setString(3, item.getColor());
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        Cart ct = new Cart();
                        ct.setProductInfoId(rs.getInt("productInfoId"));
                        ct.setSize(rs.getString("size"));
                        ct.setColor(rs.getString("color"));
                        ct.setName(rs.getString("name"));
                        ct.setQuantity(item.getQuantity());
                        ct.setPrice(rs.getFloat("price") * item.getQuantity());
                        ct.setImgDefault(rs.getString("imgDefault"));
                        productsCart.add(ct);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return productsCart;
    }

    public float getTotalCartPrice(ArrayList<Cart> cartList) {
        float sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String sql = "WITH RankedProducts AS (\n"
                            + "    SELECT P.product_info_id, P.size,  P.color, P.name AS product_name, P.quantity, PI.price, PI.img_default,\n"
                            + "        ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY \n"
                            + "            CASE \n"
                            + "                WHEN P.size = 'S' THEN 0 \n"
                            + "                WHEN P.size = 'M' THEN 1 \n"
                            + "                WHEN P.size = 'L' THEN 2 \n"
                            + "                WHEN P.size = 'XL' THEN 3 \n"
                            + "                ELSE 4\n"
                            + "            END\n"
                            + "        ) AS rn\n"
                            + "    FROM  Product P\n"
                            + "    JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                            + ")\n"
                            + "SELECT price \n"
                            + "FROM RankedProducts\n"
                            + "WHERE rn = 1 and product_info_id = ? and size = ? and color = ? \n";

                    ps = con.prepareStatement(sql);
                    ps.setInt(1, item.getProductInfoId());
                    ps.setString(2, item.getSize());
                    ps.setString(3, item.getColor());
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        sum += rs.getFloat("price") * item.getQuantity();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sum;
    }

    public void Search1(String cateId, String txt, String sql, int size) {
        listProduct = new Vector<Product>();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cateId);
            for (int i = 2; i <= size + 1; i++) {
                ps.setString(i, txt);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(7),
                        rs.getString(8)
                ));
            }
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();

        }
    }

    public void Search2(String txt, String sql, int size) {
        listProduct = new Vector<Product>();
        try {
            ps = con.prepareStatement(sql);
            for (int i = 1; i <= size; i++) {
                ps.setString(i, txt);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(7),
                        rs.getString(8)
                ));
            }
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();

        }
    }

    public void SearchByCategory(String CategoryId) {
        listProduct = new Vector<Product>();
        String sql = "WITH RankedProducts AS (\n"
                + "	 SELECT P.id, P.product_info_id, P.size,  P.color, P.name, P.quantity, P.description, PI.price, PI.img_default,\n"
                + "	ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY P.id) AS rn\n"
                + "	FROM  Product P\n"
                + "	JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "	JOIN Style S ON PI.style_id = S.id\n"
                + "	JOIN Category C ON S.cate_id = ?\n"
                + ")\n"
                + "SELECT id, product_info_id, size, color, name, quantity, "
                + "description, price, img_default FROM RankedProducts"
                + " WHERE rn = 1";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, CategoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                listProduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Student " + e.getMessage();
        }
    }

    public int getTotalProduct() {
        String sql = "SELECT Count(id)\n"
                + "FROM [ProductInfor]";
        try{
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        }catch(Exception e){
            System.out.println("getTotalProduct: " + e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        // Call getTop6NewArrival method and get the list of top 6 new arrival products
        List<String> topNewArrivals = ProductDAO.INSTANCE.getProductInfoImage("1", "Red");
        Product product1 = ProductDAO.INSTANCE.getProductByPSC("1", "S", "Red");
        // Display the top 6 new arrival products
        System.out.println(product1.getName());

    }

}
