/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import DAL.StyleDAO;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ManhPhuc
 */
public class SearchTest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    List<String> search = new ArrayList<>();
    String[] style = new String[1000];

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String sql = "WITH RankedProducts AS (\n"
                + "	 SELECT P.product_info_id, P.size, P.color, P.name, P.quantity,\n"
                + "	 PI.price, PI.img_default,C.id as catid, S.id as [sid],\n"
                + "	ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY CASE \n"
                + "                                    WHEN P.size = 'S' THEN 0 \n"
                + "                                    WHEN P.size = 'M' THEN 1 \n"
                + "                                    WHEN P.size = 'L' THEN 2 \n"
                + "                                    WHEN P.size = 'XL' THEN 3 \n"
                + "                                    ELSE 4\n"
                + "                                     END) AS rn\n"
                + "	FROM  Product P\n"
                + "	JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "	JOIN Style S ON PI.style_id = S.id\n"
                + "	JOIN Category C ON S.cate_id = C.id\n"
                + ")\n"
                + "SELECT product_info_id, size, color, name,\n"
                + "quantity, price, img_default, catid\n"
                + "FROM RankedProducts WHERE rn = 1 and ";
        String s = "";
        String catid = request.getParameter("catid");
        style = request.getParameterValues("style");
        if (style != null) {
            String s2 = "catid = ? ";
            String s1 = "And( ";
//            s += " And ";
            for (int i = 0; i < style.length; i++) {
                s1 += "[sid] = ? or ";
            }
            s1 += "0=1";
            s1 += ")";
            sql += s2;
            sql += s1;
        } else if (style == null) {
            String s2 = "catid = ?";
            sql += s2;
        }

        String price = request.getParameter("price");
        if (price != null) {
            s += " And( ";
            if (price.equals("value1")) {
                s += "(price < 100) or ";
            } else if (price.equals("value2")) {
                s += "(price between 100 and 149) or ";
            } else if (price.equals("value3")) {
                s += "(price between 150 and 200) or ";
            } else if (price.equals("value4")) {
                s += "(price > 200) or ";
            }
            s += "0=1";
            s += " )";
        }
        sql += s;

        if (style == null) {
            ProductDAO.INSTANCE.SearchFilter1(catid, sql);
        } else if (style != null) {
            ProductDAO.INSTANCE.SearchFilter(style, catid, sql);
        }

        if (ProductDAO.INSTANCE.getListProduct().isEmpty()) {
            request.setAttribute("warn", "The product you are looking for is not available in our store");
            request.getRequestDispatcher("Views/Shop.jsp").forward(request, response);
        } else {
            request.setAttribute("catid", catid);
            StyleDAO.INSTANCE.getAllStyleByCateId(catid);
            request.setAttribute("style", StyleDAO.INSTANCE.getSt());
            request.setAttribute("listProduct", ProductDAO.INSTANCE.getListProduct());
            CategoryDAO.INSTANCE.getAllCategory();
            request.setAttribute("cat", CategoryDAO.INSTANCE.getListCategory());
            request.getRequestDispatcher("Views/Shop.jsp").forward(request, response);
        }
        
        
        PrintWriter out = response.getWriter();

        for (Product pro : ProductDAO.INSTANCE.getListProduct()) {
            out.println("                    <div class=\"row\">\n"
                    + "                            <div class=\"col-md-4 mb-3 product-item link-effect\">\n"
                    + "                                <div class=\"image-holder position-relative\">\n"
                    + "                                    <a href=\"single-product.html\">\n"
                    + "                                        <img src="+(pro.getImgDefault())+" alt=\"categories\" class=\"product-image img-fluid\">\n"
                    + "                                    </a>\n"
                    + "                                    <a href=\"wishlist.html\" class=\"btn-icon btn-wishlist\">\n"
                    + "                                        <svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n"
                    + "                                        <use xlink:href=\"#heart\"></use>\n"
                    + "                                        </svg>\n"
                    + "                                    </a> \n"
                    + "                                    <div class=\"product-content\">\n"
                    + "                                        <h5 class=\"element-title text-uppercase fs-5 mt-3\">\n"
                    + "                                            <a href=\"single-product.html\">"+(pro.getName())+"</a>\n"
                    + "                                        </h5>\n"
                    + "                                        <a href=\"#\" class=\"text-decoration-none\" data-after=\"Add to cart\"><span>$"+(pro.getPrice())+"</span></a>\n"
                    + "                                    </div>\n"
                    + "                                </div>\n"
                    + "                            </div>\n"
                    + "                    </div>");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
