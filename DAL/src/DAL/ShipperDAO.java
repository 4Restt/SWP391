/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
import static DAL.ShipperDAO.INSTANCE;
import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class ShipperDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private List<Shipper> listShipper;
    private List<Location> listLocation;
    private Shipper shipper;
    public static ShipperDAO INSTANCE = new ShipperDAO();

    public ShipperDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public Shipper getShipper() {
        return shipper;
    }

    public void setShipper(Shipper shipper) {
        this.shipper = shipper;
    }

    public List<Shipper> getListShipper() {
        return listShipper;
    }

    public void setListShipper(List<Shipper> listShipper) {
        this.listShipper = listShipper;
    }

    public void logout() {
        shipper = null;
    }

    public List<Shipper> compatibleShippers(String deliver_name) {
        listShipper = new Vector<Shipper>();
        String sql = "SELECT Shipper.id AS shipper_id, \n"
                + "Shipper.name AS shipper_name, \n"
                + "Location.id AS location_id, \n"
                + "Location.name AS location_name \n"
                + "FROM Shipper \n"
                + "JOIN Location ON Shipper.location_id = Location.id \n"
                + "where delivery_id = (select id from Delivery where Delivery.[name] = ? ) ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, deliver_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Shipper shipper = Shipper.builder()
                        .id(rs.getInt("shipper_id"))
                        .name(rs.getString("shipper_name"))
                        .location_id(rs.getInt("location_id"))
                        .location_name(rs.getString("location_name"))
                        // Set các giá trị khác nếu cần
                        .build();
                listShipper.add(shipper);
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listShipper;
    }

    public void login(String name, String password) {
        String sql = "SELECT Shipper.*, [Location].[name] as location_name\n"
                + "from Shipper\n"
                + "join [Location] on Shipper.location_id = [Location].id \n"
                + "where Shipper.[name] = ? and Shipper.[password] = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                shipper = new Shipper(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getInt("location_id"),
                        rs.getString("phone"),
                        rs.getString("location_name"),
                        rs.getString("image")
                );
                System.out.println("OK");
            } else {
                System.out.println("Login failed: Incorrect username or password");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception for debugging purposes
        }
    }

    public List<Shipper> getShippersByAddress(String address) {
        listShipper = new Vector<Shipper>();
        String sql = "SELECT Shipper.*, [Location].name AS location_name "
                + "FROM Shipper "
                + "JOIN [Location] ON Shipper.location_id = [Location].id "
                + "WHERE Shipper.location_id = (SELECT id FROM [Location] WHERE name LIKE ? )";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + address + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Shipper shipper = Shipper.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .password(rs.getString("password"))
                        .location_id(rs.getInt("location_id"))
                        .phone(rs.getString("phone"))
                        .location_name(rs.getString("location_name"))
                        .build();
                listShipper.add(shipper);
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listShipper;
    }

    public List<Shipper> shipperList(String delivery_name) {
        listShipper = new Vector<>();
        String sql = "SELECT Shipper.*, [Location].name AS location_name "
                + "FROM Shipper "
                + "JOIN [Location] ON Shipper.location_id = [Location].id "
                + "WHERE Shipper.delivery_id = (SELECT id FROM Delivery WHERE Delivery.name = ? )";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, delivery_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                Shipper shipper = Shipper.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .password(rs.getString("password"))
                        .location_id(rs.getInt("location_id"))
                        .phone(rs.getString("phone"))
                        .location_name(rs.getString("location_name"))
                        .image(rs.getString("image"))
                        .build();
                listShipper.add(shipper);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listShipper;
    }

    public void shipperProfile(String id, String name, String password, String location_name, String phone, String image) {
        String sql = "UPDATE Shipper SET [name] = ? , [password] = ? , phone = ? , \n"
                + "location_id = (select id from [Location] where [name] = ? ) , \n"
                + "[image] = ? \n"
                + "WHERE id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, phone);
            ps.setString(4, location_name);
            ps.setString(5, image);
            ps.setString(6, id);
            ps.executeUpdate();
            while (rs.next()) {
                shipper = new Shipper(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
            System.out.println("successfull");
        } catch (Exception e) {
        }

    }
    
    public void cancelOrder(String id){
        String sql = "update [Order] set [status] = '6' where id = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);           
            ps.executeUpdate();
            while (rs.next()) {
                shipper = new Shipper(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
            System.out.println("successfull");
        } catch (Exception e) {
        }
    }
    public void completedOrder(String id){
        String sql = "update [Order] set [status] = '5' where id = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);           
            ps.executeUpdate();
            while (rs.next()) {
                shipper = new Shipper(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
            System.out.println("successfull");
        } catch (Exception e) {
        }
    }
   

    public static void main(String[] args) {
        ShipperDAO shipperDAO = new ShipperDAO();
        List<Shipper> shippers = shipperDAO.shipperList("Grab");
        if (shippers.isEmpty()) {
            System.out.println("No shippers found for the given address.");
        } else {
            shippers.forEach(System.out::println);
        }
    }

}
