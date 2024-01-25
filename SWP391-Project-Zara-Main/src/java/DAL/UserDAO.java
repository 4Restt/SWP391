package DAL;

import static DAL.ProductDAO.INSTANCE;
import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private User user;
    public static UserDAO INSTANCE = new UserDAO();

    public UserDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void logout() {
        user = null;
    }

    public void login(String username, String password) {
        String sql = "select * from [User] where username = ? and [password] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
        } catch (Exception e) {
        }
    }

    public void checkAccountExist(String username) {
        String sql = "select * from [User]  where username = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
        } catch (Exception e) {
        }
    }
    
    public void checkEmailExist(String email) {
        String sql = "select * from [User]  where [email] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
        } catch (Exception e) {
        }
    }

    public void signUp(String username, String password, String name, String phone,
            String address, String email) {
        String sql = "insert into [User] values(?,?,3,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert User" + e.getMessage();
        }
    }

    public void ChangeUser(String password, String username) {
        String sql = "Update [User] set [password]=? where username = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Account" + e.getMessage();
        }

    }
}
