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

    public List<Shipper> compatibleShippers(String customerAddress) {
        listShipper = new Vector<Shipper>();
        String sql = "SELECT Shipper.id AS shipper_id,\n"
                + "       Shipper.name AS shipper_name,\n"
                + "       Location.id AS location_id,\n"
                + "       Location.name AS location_name\n"
                + "FROM Shipper\n"
                + "JOIN Location ON Shipper.location_id = Location.id\n"
                + "WHERE ? LIKE CONCAT('%', Location.name, '%')";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, customerAddress);
            rs = ps.executeQuery();
            while (rs.next()) {
                Shipper shipper = Shipper.builder()
                            .id(rs.getInt("shipper_id"))
                            .name(rs.getString("shipper_name"))
                            // Set các giá trị khác nếu cần
                            .build();
            listShipper.add(shipper);
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }
        
        return listShipper;
    }

    public static void main(String[] args) {
        ShipperDAO.INSTANCE.compatibleShippers("Tu Hiep, Ha Noi");
        System.out.println(ShipperDAO.INSTANCE.compatibleShippers("Tu Hiep, Ha Noi"));
    }
    
}
