/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
import static DAL.OrderDAO.INSTANCE;
import Models.Customer;
import Models.Order;
import Models.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

public class OrderDetailDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private List<OrderDetail> listOrderDetail;
    private OrderDetail orderDetail;
    public static OrderDetailDAO INSTANCE = new OrderDetailDAO();

    public OrderDetailDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public List<OrderDetail> getListDetailByOrderId(String id) {
        listOrderDetail = new Vector<>();
        String sql = "SELECT od.*, pif.price as pricePerUnit, p.name, pif.img_default\n"
                + "FROM Orderdetail od\n"
                + "JOIN Product p on od.product_info_id =p.product_info_id and od.size = p.size and od.color = p.color\n"
                + "JOIN ProductInfor pif on p.product_info_id = pif.id\n"
                + "WHERE od.Od_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getString(9),
                        rs.getString(10)
                );
                listOrderDetail.add(orderDetail);
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrderDetail;

    }

    public List<OrderDetail> getListDetail() {
        listOrderDetail = new Vector<>();
        String sql = "SELECT od.*, pif.price as pricePerUnit, p.name, pif.img_default\n"
                + "FROM Orderdetail od\n"
                + "JOIN Product p on od.product_info_id =p.product_info_id and od.size = p.size and od.color = p.color\n"
                + "JOIN ProductInfor pif on p.product_info_id = pif.id\n";
        try {
            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getString(9),
                        rs.getString(10)
                );
                listOrderDetail.add(orderDetail);
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrderDetail;

    }

    public void updateStatus(String id, String action) {
        String sql = "";
        if (action.equals("active")) {
            sql = "UPDATE [Order]\n"
                    + "SET status = CASE \n"
                    + "                WHEN status = '0' THEN '1'\n"
                    + "                WHEN status = '1' THEN '2'\n"
                    + "                WHEN status = '2' THEN '3'\n"
                    + "                WHEN status = '3' THEN '4'\n"
                    + "                ELSE status\n"
                    + "END\n"
                    + "WHERE id = ?";
        }
        if (action.equals("deactive")) {
            sql = "UPDATE [Order]\n"
                    + "SET status = CASE \n"
                    + "                WHEN status = '0' THEN '6'\n"
                    + "                WHEN status = '1' THEN '0'\n"
                    + "                WHEN status = '2' THEN '1'\n"
                    + "                WHEN status = '3' THEN '2'\n"
                    + "                WHEN status = '4' THEN '3'\n"
                    + "                ELSE status\n"
                    + "END\n"
                    + "WHERE id = ?";
        }
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            status = "Error at OrderDetail " + ex.getMessage();
            System.out.println(status);
        }
    }

    public void cancel(String id) {
        String sql = "UPDATE [Order]\n"
                + "                    SET status = 6\n"
                + "                    WHERE id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            status = "Error at OrderDetail " + ex.getMessage();
            System.out.println(status);
        }

    }

    public void AddOrderDetail(int odid, int proid, String size,
            String color, int quantity, float price) {
        String sql = "insert into Orderdetail (Od_id, \n"
                + "product_info_id, size,\n"
                + "color, quantity, price)\n"
                + "values (?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, odid);
            ps.setInt(2, proid);
            ps.setString(3, size);
            ps.setString(4, color);
            ps.setInt(5, quantity);
            ps.setFloat(6, price);
            ps.executeUpdate();
        } catch (Exception ex) {
            status = "Error at OrderDetail " + ex.getMessage();
            System.out.println(status);
        }

    }

    public static void main(String[] args) {
        
        System.out.println(OrderDetailDAO.INSTANCE.getListDetailByOrderId("11"));
        

    }

}
