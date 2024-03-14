/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.ProductDAO;
import Models.Cart;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class AddToCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charSet=UTF-8");
        User user = (User) request.getSession().getAttribute("account") ;
        if(user == null ) {
            response.sendRedirect("login");
            return ;
        }
        
        try ( PrintWriter out = response.getWriter()) {
            ArrayList<Cart> cartList = new ArrayList<>();
            
            int pifid = Integer.parseInt(request.getParameter("pifid"));
            String size = request.getParameter("size");
            String color = request.getParameter("color");
            int quantity = Integer.parseInt(request.getParameter("quantity")) ;
            int amount = Integer.parseInt(request.getParameter("amount")) ;
            
            String returnUrl = request.getParameter("returnUrl") ;
            
            Cart c = new Cart();
            c.setProductInfoId(pifid);
            c.setSize(size);
            c.setColor(color);
            

            HttpSession session = request.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list"+user.getAccount());

            if (cart_list == null) {
                c.setQuantity(1);
                cartList.add(c);
                session.setAttribute("cart-list"+user.getAccount(), cartList);
                response.sendRedirect("home");
            } else {
                cartList = cart_list;
                boolean exist = false;

                for (Cart cart : cart_list) {
                    if (cart.getProductInfoId() == pifid && cart.getSize().equals(size) && cart.getColor().equals(color)) {
                        exist = true;
                        cart.setQuantity(cart.getQuantity() + amount);
                        break;
                    }
                }

                if (!exist) {
                    c.setQuantity(1);
                    cartList.add(c);
                }
                session.setAttribute("cart-list"+user.getAccount(), cartList);
                response.sendRedirect(returnUrl==null?"home":returnUrl);

            }
        }
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
