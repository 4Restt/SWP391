/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.ProductDAO;
import Helper.MemCached;
import Models.Cart;
import Models.Customer;
import Models.Product;
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
        Customer customer = (Customer) request.getSession().getAttribute("account");
        if (customer == null) {
            response.sendRedirect("login");
            return;
        }
        try ( PrintWriter out = response.getWriter()) {
            List<Cart> cartList = new ArrayList<>();

            int pifid = Integer.parseInt(request.getParameter("pifid"));
            String size = request.getParameter("size");
            String color = request.getParameter("color");
            int amount = Integer.parseInt(request.getParameter("amount"));

            Cart c = new Cart();
            c.setProductInfoId(pifid);
            c.setSize(size);
            c.setColor(color);

            String returnUrl = request.getParameter("returnUrl");

            HttpSession session = request.getSession();
            List<Cart> cart_list = MemCached.mem.get(customer.getId());

            if (cart_list == null) {
                c.setQuantity(1);
                cartList.add(c);
                MemCached.mem.put(customer.getId(), cartList);
                response.sendRedirect("home");
            } else {
                cartList = cart_list;
                boolean exist = false;

                for (Cart cart : cart_list) {
                    if (cart.getProductInfoId() == pifid && cart.getSize().equals(size) && cart.getColor().equals(color)) {
                        exist = true;

                        int newQuantity = cart.getQuantity() + amount;
                        int productQuantity = getProductQuantity(pifid);

                        if (cart.getQuantity() <= 0) {
                            cart.setQuantity(1);
                        } else if (newQuantity >= productQuantity) {
                            cart.setQuantity(productQuantity);
                        } else {
                            cart.setQuantity(newQuantity);
                        }

                        break;
                    }
                }

                if (!exist) {
                    c.setQuantity(amount);
                    cartList.add(c);

                }
//                session.setAttribute("cart-list" + customer.getAccount(), cartList);
                MemCached.mem.put(customer.getId(), cartList);
                response.sendRedirect(returnUrl == null ? "home" : returnUrl);

            }

        }
    }

    private int getProductQuantity(int productId) {
        List<Product> products = ProductDAO.INSTANCE.getAllProduct();
        for (Product product : products) {
            if (product.getProductInfoId() == productId) {
                return product.getQuantity();
            }
        }
        return 0;
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
