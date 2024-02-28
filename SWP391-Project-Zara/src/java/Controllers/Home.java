/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Models.Category;
import Models.Product;
import java.util.ArrayList;
public class Home extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Category> listCategory = CategoryDAO.INSTANCE.getAllCategory();
        List<Product> listNewArrival = ProductDAO.INSTANCE.getTop6NewArrival();
        ArrayList<Models.Cart> cart_list = (ArrayList<Models.Cart>) request.getSession().getAttribute("cart-list");
        int totalQ = 0 ;
        if (cart_list != null) {
//            request.setAttribute("cart_list", cart_list);
            for (Models.Cart c : cart_list) {
                totalQ += c.getQuantity() ;
            }
        }

        request.setAttribute("totalQ", totalQ);
        
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listNewArrival", listNewArrival);
        request.getRequestDispatcher("Views/Home.jsp").forward(request, response);
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
    }
}
