
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Product;
import Models.SaleEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author ManhPhuc
 */
public class SaleDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    public static SaleDAO INSTANCE = new SaleDAO();
    private SaleEvent sale;

    public SaleEvent getSale() {
        return sale;
    }

    public void setSale(SaleEvent sale) {
        this.sale = sale;
    }

    public static SaleDAO getINSTANCE() {
        return INSTANCE;
    }

    public static void setINSTANCE(SaleDAO INSTANCE) {
        SaleDAO.INSTANCE = INSTANCE;
    }

    public SaleDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public void InsertSaleEvent(String startdate, String enddate, String name) {
        String sql = "INSERT INTO SaleEvent (startdate, enddate, name) VALUES (?, ?, ?);";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, startdate);
            ps.setString(2, enddate);
            ps.setString(3, name);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public static void main(String[] args) {
        SaleDAO.INSTANCE.InsertSaleEvent("2024-03-04", "2024-03-14", "30 thang 5");
    }

    public void InsertSale(int saleeventid, String proinforid, float percent) {
        String sql = "insert into Sale(Saleevent_id, Proinfo_id, [percent]) values (?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, saleeventid);
            ps.setString(2, proinforid);
            ps.setFloat(3, percent);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void UpdateSale(int proinforid, float percent, int saleeventid) {
        String sql = "Update Sale set Proinfo_id=?, [percent]=? "
                + "where Saleevent_id =?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, proinforid);
            ps.setFloat(2, percent);
            ps.setInt(3, saleeventid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void getIdSaleEvent(String startdate, String enddate, String name) {
        String sql = "select * from SaleEvent where startdate = ? and enddate =? and [name] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, startdate);
            ps.setString(2, enddate);
            ps.setString(3, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                sale = new SaleEvent(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );
            }
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void updateSaleEvent(int id, String startdate, String enddate, String name) {
        String sql = "Update SaleEvent set startdate = ? , enddate =? , [name] = ? "
                + "where id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, startdate);
            ps.setString(2, enddate);
            ps.setString(3, name);
            ps.setInt(4, id);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void updateSale(int saleevent_id, int proinforid, float percent) {
        String sql = "Update Sale set Proinfo_id = ? and [percent] =? "
                + "where Saleevent_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, saleevent_id);
            ps.setInt(2, proinforid);
            ps.setFloat(3, percent);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void DeleteSale(int saleeventid, int proinfoid, float percent) {
        String sql = "DELETE FROM Sale\n"
                + "WHERE Saleevent_id = ?\n"
                + "  AND Proinfo_id = ?\n"
                + "  AND [percent] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, saleeventid);
            ps.setInt(2, proinfoid);
            ps.setFloat(3, percent);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void DeleteSaleEvent(int id) {
        String sql = "DELETE FROM SaleEvent\n"
                + "WHERE id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

}
