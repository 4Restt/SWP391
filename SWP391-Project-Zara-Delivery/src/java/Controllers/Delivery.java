/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.*;
import Models.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author admin
 */
public class Delivery extends HttpServlet {

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

        request.getRequestDispatcher("Views/Delivery.jsp").forward(request, response);
    }
    List[] address = new List[1000];

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession ses = request.getSession(false);

        if (ses != null) {
            String deliveryName = (String) ses.getAttribute("deliveryName");

            List<Order> unassignedOrders = OrderDAO.INSTANCE.getUnassignedOrders(deliveryName);
            List<Order> alreadyOrders = OrderDAO.INSTANCE.getAlShipperOrders(deliveryName);
            List<Shipper> compatibleShippers = (List) ShipperDAO.INSTANCE.compatibleShippers(deliveryName);
            List listOfAddresses = OrderDAO.INSTANCE.listOfAddresses(deliveryName);
            List<Shipper> listShipper = (List) ShipperDAO.INSTANCE.shipperList(deliveryName);
            //Update profile, manage shipper
            String content = (String) request.getAttribute("content");
            if (content != null && content.equals("profile")) {
                request.setAttribute("content", "profile");
            } else {
                request.setAttribute("content", "unassignedOrders");
            }
            // Đặt danh sách đơn hàng vào attribute của request   
            request.setAttribute("delivery", DeliveryDAO.INSTANCE.getDeliverybyName(deliveryName));
            request.setAttribute("orders", unassignedOrders);
            request.setAttribute("alreadyOrders", alreadyOrders);
            request.setAttribute("shippers", compatibleShippers);
            request.setAttribute("listOfAddresses", listOfAddresses);
            request.setAttribute("listShipper", listShipper);
            

        }
        request.getRequestDispatcher("Views/Delivery.jsp").forward(request, response);

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
