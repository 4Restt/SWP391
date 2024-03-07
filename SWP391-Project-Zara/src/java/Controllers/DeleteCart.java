/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.ProductDAO;
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
public class DeleteCart extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        ArrayList<Models.Cart> cart_list = (ArrayList<Models.Cart>) session.getAttribute("cart-list");
        List<Models.Cart> cartProduct = null;

        if (cart_list != null) {
            cartProduct = ProductDAO.INSTANCE.getCartProduct(cart_list);
        }

        request.setAttribute("cart_list", cartProduct);
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
        User user = (User) request.getSession().getAttribute("account");

        try ( PrintWriter out = response.getWriter()) {

            int pifid = Integer.parseInt(request.getParameter("pifid"));
            String size = request.getParameter("size");
            String color = request.getParameter("color");

            if (pifid != 0 && size != null && color != null) {
                HttpSession session = request.getSession();
                ArrayList<Models.Cart> cart_list = (ArrayList<Models.Cart>) session.getAttribute("cart-list" + user.getAccount());
                if (cart_list != null) {
                    for (Models.Cart cart : cart_list) {
                        if (cart.getProductInfoId() == pifid && cart.getSize().equals(size) && cart.getColor().equals(color)) {
                            cart_list.remove(cart_list.indexOf(cart));
                            break;
                        }
                    }
                    response.sendRedirect("cart");
                }
            } else {
                response.sendRedirect("cart");
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
