/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Category;
import Models.Style;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author ManhPhuc
 */
public class StyleDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    public static StyleDAO INSTANCE = new StyleDAO();
    private List<Style> st;

    public List<Style> getSt() {
        return st;
    }

    public void setSt(List<Style> st) {
        this.st = st;
    }

    public StyleDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public void getAllStyleByCateId(String id) {
        st = new Vector<Style>();
        String sql = "select * from Style where cate_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                st.add(new Style(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (Exception e) {
            status = "Error at read Style " + e.getMessage();
        }
    }

}
