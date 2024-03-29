package Controllers;
import DAL.CategoryDAO;
import DAL.ProductDAO;
import Helper.MemCached;
import Models.Customer;
import Models.Product;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
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
        Customer customer = (Customer) request.getSession().getAttribute("account");

        
        List<Product> listNewArrival = ProductDAO.INSTANCE.getTop6NewArrival();
        List<Product> listBestSelling = ProductDAO.INSTANCE.getBestSellingProduct();
        List<Models.Cart> cart_list = customer == null ? null : MemCached.mem.get(customer.getId());
        int totalQ = 0;
        if (cart_list != null) {
            for (Models.Cart c : cart_list) {
                totalQ += c.getQuantity();
            }
        }

        request.setAttribute("totalQ", totalQ);
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
    String productInfoId = request.getParameter("pifid");
    String size = request.getParameter("size");
    String color = request.getParameter("color");
    
    // Get product information based on productInfoId, size, and color
    Product product = ProductDAO.INSTANCE.getProductByPSC(productInfoId, size, color);
    
    // Call your DAO or service method to get the list of image paths based on the provided parameters
    List<String> listImgPath = ProductDAO.INSTANCE.getProductInfoImage(productInfoId, color);
    
    // Prepare response data
    JsonObject jsonResponse = new JsonObject();
    jsonResponse.addProperty("productQuantity", product.getQuantity());
    JsonArray imgPathsArray = new JsonArray();
    for (String imgPath : listImgPath) {
        imgPathsArray.add(new JsonPrimitive(imgPath));
    }
    jsonResponse.add("listImgPath", imgPathsArray);

    // Set content type and write response
    response.setContentType("application/json");
    response.getWriter().write(jsonResponse.toString());
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
