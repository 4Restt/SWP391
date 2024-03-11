package DAL;

import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class UserDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private User user;
    public static UserDAO INSTANCE = new UserDAO();
    private List<User> listStaff;

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

    public User checkEmailExist1(String email) {
        User u = new User();
        String sql = "select * from [User]  where [email] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println("asdsad"+UserDAO.INSTANCE.getPasswordByid("3"));
//        User u = UserDAO.INSTANCE.checkEmailExist1("phuckmhe170685@fpt.edu.vn");
//        List<User> ll = UserDAO.INSTANCE.pagingStaff(1);
//        UserDAO.INSTANCE.login("manager", "manager");
//        System.out.println(UserDAO.INSTANCE.getUser());
//        System.out.println(ll);
//        System.out.println(u.getAccount());
        

    }

    public void login(String username, String password) {
        String sql = "select * from [User] where username = ? and [password] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
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
                user = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
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
                user = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
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
        String sql = "Update [User] set [password]= ? where username = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Account" + e.getMessage();
        }

    }

    public List<User> getAllUser() {
        String sql = "select * from [User] ";
        List<User> listUser = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );

                listUser.add(user);
            }
        } catch (Exception e) {
            System.out.println("getAllUser: " + e.getMessage());
        }
        return listUser;
    }

    public void ChangeEmail(String email, String username) {
        String sql = "Update [User] set [email]=? where username = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, username);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update Account" + e.getMessage();
        }

    }

    public void ChangePhone(String phone, String username) {
        String sql = "Update [User] set [phone]=? where username = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ChangePhone: " + e.getMessage());
        }

    }

    public void addAddress(String address, String username) {
        String sql = "Update [User] set [address]=address + '/' + ? where username = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, address);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }

    }

    public void updateAddress(String address, String username) {
        String sql = "Update [User] set [address]= ? where username = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, address);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }

    }

    public void updateUserName(String name, String username) {
        String sql = "Update [User] set [name]= ? where username = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }

    }

    public List<User> getListStaff() {
        listStaff = new Vector<User>();
        String sql = "SELECT * FROM [User] WHERE rollid = 3 ORDER BY id DESC";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );

                listStaff.add(user);
            }
        } catch (Exception e) {
            System.out.println("getAllUser: " + e.getMessage());
        }
        return listStaff;
    }

    public void addNewStaff(String username, String password, String name, String phone,
            String address, String email, String image) {
        String sql = "INSERT INTO [dbo].[User] ([username], [password], [rollid], [name], [phone], [address], [email], [image])\n"
                + "VALUES (?, ?, 3, ?, ?, ?, ?, ?);";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.setString(7, image);
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert User" + e.getMessage();
        }
    }

    public void updateStatus(String id, String status) {
        String sql = "Update [User] set [status]= ? where id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }

    }

    public void editStaff(String id, String username, String password, String name, String phone,
            String address, String email, String image) {
        String sql = "Update [User] set [username]= ?, [password]=?, [name] = ?, [phone] = ?, [address] = ?, "
                + "[email] = ?, [image] = ? where id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(8, id);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.setString(7, image);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }

    }

    public int getTotalStaff() {
        String sql = "SELECT count(*) from [User] where rollid = 3 ";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getTotalStaff: " + e.getMessage());
        }
        return 0;
    }

    public List<User> pagingStaff(int index) {
        listStaff = new Vector<>();
        String sql = "SELECT * FROM [User]\n"
                + "WHERE rollid = 3\n"
                + "ORDER BY id	DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index-1)*3);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );
                listStaff.add(user);
            }
        } catch (Exception e) {
            System.out.println("getTotalStaff: " + e.getMessage());
        }
        return listStaff;
    }
    public User getUserById(String id){
        String sql = "SELECT * FROM [User] Where id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return( new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                ));
               
            }
        } catch (Exception e) {
            System.out.println("getTotalStaff: " + e.getMessage());
        }
        return null;
    }
    public void deleteUser(String id){
        String sql = "DELETE FROM [User] Where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }
    }
    public String getPasswordByid(String id){
         String sql = "SELECT [password] from [User] WHERE id = ?";
         try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("password");    
            }
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }
         return null;
    }
    public void changePassword(String id, String newPass){
        String sql = "Update [User] set [password]= ? where id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("addAddress: " + e.getMessage());
        }
    }
}
