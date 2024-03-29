/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.CustomerDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import Models.Customer;
import Models.OrderDetail;
import Models.Product;
import Models.User;
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
 * @author FPT SHOP
 */
public class OrderCancle extends HttpServlet {

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
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("account");
        if (customer == null) {
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        }
        
        OrderDetailDAO.INSTANCE.cancel(id);
        List<OrderDetail> orderdetail = OrderDetailDAO.INSTANCE.getListDetailByOrderId(id);
        for (OrderDetail od : orderdetail) {
           
            Product pro = ProductDAO.INSTANCE.getProductByPid2(String.valueOf(od.getProductInforId()), od.getSize(), od.getColor()).get(0);
            ProductDAO.INSTANCE.UpdateProductQuantity((pro.getQuantity() + od.getQuantity()),
                    Integer.parseInt(od.getProductInforId()), od.getSize(), od.getColor());
        }
         request.setAttribute("listOrderDetail", OrderDetailDAO.INSTANCE.getListDetail());
        request.setAttribute("listOrder", OrderDAO.INSTANCE.getListOrderByCustomerId(customer.getId()));
        request.getRequestDispatcher("Views/MyOrder.jsp").forward(request, response);

        
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
