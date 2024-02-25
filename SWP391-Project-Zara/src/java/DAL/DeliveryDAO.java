/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import static DAL.DeliveryDAO.INSTANCE;
import Models.Delivery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DeliveryDAO {
    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Delivery delivery;
    public static DeliveryDAO INSTANCE = new DeliveryDAO();
    
    public DeliveryDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }
    
    public Delivery getDelivery() {
        return delivery;
    }

    public void setDelivery(Delivery delivery) {
        this.delivery = delivery;
    }

    public void logout() {
        delivery = null;
    }
    
    public void login(String name, String password) {
        String sql = "select * from [Delivery] where [name] = ? and [password] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                delivery = new Delivery(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                        
                );
            }
             System.out.println("successfull");
        } catch (Exception e) {
        }
    }
    public void deliveryName(String name, String password) {
        String sql = "select * from [Delivery] where [name] = ? and [password] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                delivery = new Delivery(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                        
                );
            }
             System.out.println("successfull");
        } catch (Exception e) {
        }
    }
    

    public static void main(String[] args) {
        DeliveryDAO.INSTANCE.login("Grab", "secure123");
        
    }
    
    public void deliverProfile(int id , String name , String password , String email , String phone){
        String sql = "";
        
    }
    
}
