/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.CategoryDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import DAL.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Models.Category;
import Models.Product;
import Models.User;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

public class Home extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        if (user == null) {
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        }
        request.setAttribute("totalProduct", ProductDAO.INSTANCE.getTotalProduct());
        request.setAttribute("revenue", OrderDAO.INSTANCE.getRevenue());
        request.setAttribute("profile", UserDAO.INSTANCE.getUserById(user.getId()));
        request.setAttribute("totalStaff", UserDAO.INSTANCE.getTotalStaff());
        request.getRequestDispatcher("Views/Manager.jsp").forward(request, response);
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
