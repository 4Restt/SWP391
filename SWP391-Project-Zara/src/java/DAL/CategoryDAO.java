package DAL;

import Models.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class CategoryDAO {

    private Connection con = null;
    private String status = "OK";
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private List<Category> listCategory;
    public static CategoryDAO INSTANCE = new CategoryDAO();

    public List<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }

    public CategoryDAO() {
        if (INSTANCE == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at connection " + e.getMessage();
            }
        }
    }

    public List<Category> getAllCategory() {
        listCategory = new Vector<Category>();
        String sql = "select * from Category";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listCategory.add(new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }
        return listCategory;
    }

    public Category getCateByProInfoId(String product_info_id) {
        String sql = "SELECT C.id, C.name, C.description FROM Category C\n"
                + "JOIN Style S on C.id = S.cate_id\n"
                + "JOIN ProductInfor P on S.id = P.style_id\n"
                + "WHERE P.id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, product_info_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
            status = "Error at read Department " + e.getMessage();
        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDAO.INSTANCE.getAllCategory();
        System.out.println(CategoryDAO.INSTANCE.getListCategory().toString());
        System.out.println(CategoryDAO.INSTANCE.getCateByProInfoId("1"));
    }
}
