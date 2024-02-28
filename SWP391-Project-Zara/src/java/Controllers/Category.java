
package Controllers;
import DAL.CategoryDAO;
import DAL.ProductDAO;
import DAL.StyleDAO;
import Models.Product;
import Models.Style;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
public class Category extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String cateId = request.getParameter("cid");
        List<Product> listProduct = ProductDAO.INSTANCE.getProductByCid(cateId);
        CategoryDAO.INSTANCE.getAllCategory();
        request.setAttribute("listCategory", CategoryDAO.INSTANCE.getListCategory());
        String name = CategoryDAO.INSTANCE.getCategorybyId(cateId).getName();
        StyleDAO.INSTANCE.getAllStyleByCateId(cateId);
        request.setAttribute("style",StyleDAO.INSTANCE.getSt());
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("name", name);
        request.setAttribute("catid", cateId);
        request.getRequestDispatcher("Views/Shop.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
