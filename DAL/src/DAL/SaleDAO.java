
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Customer;
import Models.Product;
import Models.SaleEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

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
    private List<SaleEvent> salelist;

    public List<SaleEvent> getSalelist() {
        return salelist;
    }

    public void setSalelist(List<SaleEvent> salelist) {
        this.salelist = salelist;
    }

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

    public void InsertSale(int saleeventid, String proinforid, float percent) {
        String sql = "insert into Sale(Saleevent_id, Proinfo_id, [percent],status) values (?,?,?,1)";
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

    public void UpdateSalePercentBySaId(float percent, int saleeventid) {
        String sql = "Update Sale set [percent]=? "
                + "where Saleevent_id =?";
        try {
            ps = con.prepareStatement(sql);
            ps.setFloat(1, percent);
            ps.setInt(2, saleeventid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public SaleEvent getIdSaleEvent(String startdate, String enddate, String name) {
        String sql = "SELECT *,id FROM SaleEvent"
                + " WHERE startdate = ? and enddate = ? and [name] = ?";
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
                        rs.getString(4),
                        rs.getInt(5)
                );
            }
            return sale;
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
        return null;
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

    public void DeleteSale(int saleeventid) {
        String sql = "DELETE FROM Sale\n"
                + "WHERE Saleevent_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, saleeventid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void DeleteSaleByProid(int proid) {
        String sql = "DELETE FROM Sale\n"
                + "WHERE Proinfo_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, proid);
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

    public void DeactivateSale(int said) {
        String sql = "Update Sale set status = 0\n"
                + "WHERE Saleevent_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, said);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void DeactivateSalePro(int said, int proid) {
        String sql = "Update Sale set status = 0\n"
                + "WHERE Saleevent_id = ? and Proinfo_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, said);
            ps.setInt(2, proid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }
    
    public void ActivateSalePro(int said, int proid) {
        String sql = "Update Sale set status = 1\n"
                + "WHERE Saleevent_id = ? and Proinfo_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, said);
            ps.setInt(2, proid);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public void ActivateSale(int said) {
        String sql = "Update Sale set status = 1\n"
                + "WHERE Saleevent_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, said);
            rs = ps.executeQuery();
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
    }

    public List<SaleEvent> getAllListEvent() {
        salelist = new Vector<SaleEvent>();
        String sql = "SELECT se.*, MAX(sa.[status]) AS max_status\n"
                + "FROM SaleEvent se\n"
                + "JOIN Sale sa ON se.id = sa.Saleevent_id \n"
                + "GROUP BY se.id, se.[name], se.startdate, se.enddate;";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                salelist.add(new SaleEvent(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)
                ));
            }
            return salelist;
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
        return null;
    }

    public SaleEvent getSaleEventById(String id) {
        String sql = "SELECT *"
                + " FROM SaleEvent where id= ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                sale = new SaleEvent(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)
                );
            }
            return sale;
        } catch (Exception e) {
            status = "Error at SearchFilter" + e.getMessage();
        }
        return null;
    }

    public static void main(String[] args) {
       SaleDAO.INSTANCE.InsertSale(9, "2", (float) 0.4);
    }
}
