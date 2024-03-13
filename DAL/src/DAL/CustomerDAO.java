/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
import static DAL.CustomerDAO.INSTANCE;
import Models.Customer;
import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class CustomerDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private List<Customer> listCustomer;
    private Customer customer;
    public static CustomerDAO INSTANCE = new CustomerDAO();

    public CustomerDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void logout() {
        customer = null;
    }
    
    public Customer checkEmailExist1(String email) {
        
        String sql = "select * from [Customer]  where [email] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Customer(
                        rs.getInt(1),
                         rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                ));
                
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void login(String username, String password) {
        String sql = "select * from [Customer] where account = ? and [password] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                customer = new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (Exception e) {
        }
    }

    public void checkAccountExist(String username) {
        String sql = "select * from Customer  where name = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                customer = new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (Exception e) {
        }
    }
    
    public void checkEmailExist(String email) {
        String sql = "select * from Customer  where [email] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                customer = new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (Exception e) {
        }
    }

    public void signUp(String name, String address, String phone, String email,
            String account, String password) {
        String sql = "insert into Customer([name], [address], phone, email, account, [password]) values(?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, account);
            ps.setString(6, password);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert Customer" + e.getMessage();
        }
    }

    public void ChangeUser(String password, String username) {
        String sql = "Update Customer set [password]=? where account = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Account" + e.getMessage();
        }

    }
    
    public List<Customer> listOfCustomers() {
        listCustomer = new Vector<Customer>();
        String sql = "select * from Customer";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listCustomer.add(new Customer(
                        rs.getInt(1),                      
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }

        return listCustomer;
    }
    public void updateStatus(String id, String status) {
        String sql = "Update [Customer] set [status]= ? where id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }

    }
    public void editCustomer(String id, String username, String password, String name, String phone,
            String address, String email, String image) {
        String sql = "Update [Customer] set [name]= ?, [address]=?, [phone] = ?, [email] = ?, [account] = ?, "
                + "[password] = ?, [image] = ? where id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(8, id);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.setString(7, image);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }

    }
    
    public Customer checkAccountGoogleExist(String accesstoken) {
        String sql = "select * from [Customer] where account= ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, accesstoken);
            rs = ps.executeQuery();
            while (rs.next()) {
                customer = new Customer(
                        rs.getInt(1),                      
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
            return customer;
        } catch (Exception e) {
        }
        return null;
    }
    
    
        public void addCustomerGoogle(String accesstoken, String name, String email, String image) {
        String sql = "insert into [Customer](account, [name], [email], [image]) values(?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, accesstoken);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, image);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert User" + e.getMessage();
        }
    }
        
    public static void main(String[] args) {
        
        System.out.println(CustomerDAO.INSTANCE.checkAccountGoogleExist("116104562155113340961"));
        
    }
}
