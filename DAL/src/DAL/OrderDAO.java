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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

public class OrderDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private List<Order> listOrder;
    private Order order;
    public static OrderDAO INSTANCE = new OrderDAO();

    public OrderDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<Order> getListOrder() {
        return listOrder;
    }

    public void setListOrder(List<Order> listOrder) {
        this.listOrder = listOrder;
    }

    public List<Order> getUnassignedOrders(String name) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.address AS customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "FROM [Order]\n"
                + "JOIN Customer ON [Order].customer_id = Customer.id\n"
                + "WHERE [Order].delivery_id = (SELECT id FROM Delivery WHERE name = ? ) and Shipper_id is Null;";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public List<Order> getAlShipperOrders(String name) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.address AS customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "FROM [Order]\n"
                + "JOIN Customer ON [Order].customer_id = Customer.id\n"
                + "WHERE [Order].delivery_id = (SELECT id FROM Delivery WHERE name = ? ) and Shipper_id is not Null and [Order].[status] = '4';";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public List<Order> getCompletedOrdersbyDeliver(String name) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.address AS customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "FROM [Order]\n"
                + "JOIN Customer ON [Order].customer_id = Customer.id\n"
                + "WHERE [Order].delivery_id = (SELECT id FROM Delivery WHERE name = ? ) and Shipper_id is not Null and [Order].[status] = '5';";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public List<Order> getCancelledOrdersbyDeliver(String name) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.address AS customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "FROM [Order]\n"
                + "JOIN Customer ON [Order].customer_id = Customer.id\n"
                + "WHERE [Order].delivery_id = (SELECT id FROM Delivery WHERE name = ? ) and Shipper_id is not Null and [Order].[status] = '6';";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public String getCustomerAddressById(int id) {
        String sql = "SELECT address FROM Customer WHERE id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("address"); // Lấy địa chỉ và trả về
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }
        return null;
    }

    public List<Order> getAssignedOrders(String shipper_name) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.address AS customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "                 FROM [Order]\n"
                + "                 JOIN Customer ON [Order].customer_id = Customer.id\n"
                + "                 JOIN Shipper ON [Order].shipper_id = Shipper.id\n"
                + "                 WHERE [Order].shipper_id = (select id from Shipper where [name] = ? and [Order].[status] = '4' )";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, shipper_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public List<Order> getCompletedOrders(String shipper_name) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.address AS customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "                 FROM [Order]\n"
                + "                 JOIN Customer ON [Order].customer_id = Customer.id\n"
                + "                 JOIN Shipper ON [Order].shipper_id = Shipper.id\n"
                + "                 WHERE [Order].shipper_id = (select id from Shipper where [name] = ? and [Order].[status] = '5' )";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, shipper_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public List<Order> getCancelledOrders(String shipper_name) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.address AS customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "                 FROM [Order]\n"
                + "                 JOIN Customer ON [Order].customer_id = Customer.id\n"
                + "                 JOIN Shipper ON [Order].shipper_id = Shipper.id\n"
                + "                 WHERE [Order].shipper_id = (select id from Shipper where [name] = ? and [Order].[status] = '6' )";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, shipper_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public void AssignOrdertoShipper(String shipperId, String orderId) {
        String sql = "UPDATE [Order] SET Shipper_id = ? WHERE id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, shipperId);
            ps.setString(2, orderId);

            ps.executeUpdate();
            System.out.println("Order " + orderId + " has been assigned to shipper " + shipperId);
        } catch (Exception e) {
            status = "Error at AssignOrdertoShipper " + e.getMessage();
            System.out.println(status);
        }
    }

    //Chay o Delivery severlet
    public List<String> listOfAddresses(String deliveryName) {
        List<String> addresses = new ArrayList<>();
        // Cập nhật câu lệnh SQL để lấy 2 phần từ cuối của địa chỉ
        String sql = "SELECT DISTINCT "
                + "REVERSE(SUBSTRING(REVERSE(Customer.[address]), 0, CHARINDEX(',', REVERSE(Customer.[address]), CHARINDEX(',', REVERSE(Customer.[address])) + 1))) AS customerAddressLastParts "
                + "FROM [Order] "
                + "JOIN Customer ON [Order].Customer_id = Customer.id "
                + "JOIN Delivery ON [Order].delivery_id = Delivery.id "
                + "WHERE Delivery.[name] = ? and [Order].Shipper_id is null";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, deliveryName);
            rs = ps.executeQuery();
            while (rs.next()) {
                // Lấy phần của địa chỉ đã được chỉnh sửa
                String address = rs.getString("customerAddressLastParts");
                addresses.add(address);
            }
        } catch (Exception e) {
            System.out.println("Error at listOfAddresses: " + e.getMessage());
            // Xử lý lỗi hoặc ghi log tại đây
        }
        return addresses;

    }

    public String getEmailbyOrderId(String id) {
        String sql = "select email from [Order] o\n"
                + "Join Customer c on c.id = o.Customer_id\n"
                + "where o.id = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("email");
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }
        return null;
    }

    public List<Order> getOrdersByAddress(String address) {
        listOrder = new Vector<Order>();
        String sql = "SELECT [Order].*, Customer.[address], Customer.name as customerName, Customer.phone as phoneNumber "
                + "FROM Customer "
                + "JOIN [Order] ON [Order].Customer_id = Customer.id "
                + "WHERE Customer.[address] LIKE ? AND [Order].Shipper_id IS NULL;";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + address + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                listOrder.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;
    }

    public Order getOrderbyId(String id) {
        String sql = "Select o.* , [address] as customerAddress, Customer.name as customerName, Customer.phone as phoneNumber\n"
                + "from [Order] o\n"
                + "JOIN Customer c ON c.id = o.Customer_id\n"
                + "where o.id = ? ";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );
                return order;
            }

        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để dễ dàng debug
        }
        return null;
    }

    public List<Order> getListOrderByStatus(String status) {
        listOrder = new Vector<>();
        String sql = "SELECT o.*, Customer.address AS customerAddress, Customer.name, Customer.phone\n"
                + "FROM [Order] o\n"
                + "JOIN Customer ON o.customer_id = Customer.id\n"
                + "WHERE o.status = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );
                listOrder.add(order);
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listOrder;

    }

    public void updateStaff(String staffName, String id) {
        String sql = "UPDATE [Order] SET Staff_name = ? WHERE id = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, staffName);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            status = "Error at OrderDetail " + ex.getMessage();
            System.out.println(status);
        }
    }

    public static void main(String[] args) {

        System.out.println(OrderDAO.INSTANCE.getListOrderByStatus("0"));

    }

    public float getRevenue() {
        String sql = "SELECT SUM(totalprice) AS total_price\n"
                + "FROM [Order] WHERE status = 5";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getFloat(1);
            }
        } catch (Exception e) {
            System.out.println("getRevenue: " + e.getMessage());
        }
        return 0;
    }
}
