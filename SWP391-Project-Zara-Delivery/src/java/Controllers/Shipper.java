/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.OrderDAO;
import DAL.ShipperDAO;
import Models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
public class Shipper extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html><body>");

            out.println("</body></html>");

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

        request.getRequestDispatcher("Views/Shipper.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Lấy session hiện tại

        if (session != null) {

            String shipperName = (String) session.getAttribute("shipperName");
            List<Order> assignedOrders = OrderDAO.INSTANCE.getAssignedOrders((String) session.getAttribute("shipperName"));
            List<Order> completedOrders = OrderDAO.INSTANCE.getCompletedOrders((String) session.getAttribute("shipperName"));
            List<Order> canceledOrders = OrderDAO.INSTANCE.getCancelledOrders((String) session.getAttribute("shipperName"));
            
            String content = (String) request.getAttribute("content");
            if (content != null && content.equals("profile")) {
                request.setAttribute("content", "profile");
            } else {
                request.setAttribute("content", "newOrdersContent");
            }
            

            request.setAttribute("shipperName", shipperName);
            request.setAttribute("assignedOrders", assignedOrders);
            request.setAttribute("completedOrders", completedOrders);
            request.setAttribute("canceledOrders", canceledOrders);
            request.setAttribute("profile", ShipperDAO.INSTANCE.getShipperbyAcc(shipperName));
        }

        // Chuyển hướng tới JSP với thông tin đã được đặt
        request.getRequestDispatcher("Views/Shipper.jsp").forward(request, response);
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
