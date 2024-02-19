package Controllers;
import DAL.CategoryDAO;
import DAL.ProductDAO;
import Models.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
public class Detail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String productInforId = request.getParameter("pifid");
        String size = request.getParameter("size");
        String color = request.getParameter("color");      
        List<Models.Category> listCategory = CategoryDAO.INSTANCE.getAllCategory();
        List<String> listImgPath = ProductDAO.INSTANCE.getProductInfoImage(productInforId, color);
        request.setAttribute("product", ProductDAO.INSTANCE.getProductByPSC(productInforId, size, color));
        request.setAttribute("category", CategoryDAO.INSTANCE.getCateByProInfoId(productInforId));
        request.setAttribute("listColor", ProductDAO.INSTANCE.getProductInfoColor(productInforId, size));
        request.setAttribute("listSize", ProductDAO.INSTANCE.getProductInfoSize(productInforId, color));
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listImgPath", listImgPath);
        request.getRequestDispatcher("Views/Detail.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
