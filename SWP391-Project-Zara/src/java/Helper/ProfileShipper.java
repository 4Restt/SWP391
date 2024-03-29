package Helper;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import DAL.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author FPT SHOP
 */
public class ProfileShipper extends HttpServlet {

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
        String action = request.getParameter("action");
        switch (action) {
            case "change":
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String img = request.getParameter("image");
                String imgBackUp = request.getParameter("imageBackUp");
                if (imgBackUp.isEmpty()) {
                    imgBackUp = "images/profile-image-default.jpg";
                }
                if (img.isEmpty()) {
                    img = imgBackUp;
                }
                request.setAttribute("messChange", "<div id=\"successMessage\" class=\"alert alert-success mt-3 col-lg-6\">Profile save successful!</div>");
                ShipperDAO.INSTANCE.shipperProfile(id, name, password, address, phone, img);
                break;
            case "changepass":
                String changePassId = request.getParameter("id");
                String oldPassword = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                String rePassword = request.getParameter("rePassword");
                String warn = "";
                if (newPassword.equals(rePassword)) {
                    if (ShipperDAO.INSTANCE.getPasswordByid(changePassId).equals(oldPassword)) {
                        ShipperDAO.INSTANCE.changePassword(changePassId, newPassword);
                        request.setAttribute("mess", "<div id=\"successMessage\" class=\"alert alert-danger mt-3 col-lg-6\">Change successfully</div>");
                    } else {
                        request.setAttribute("mess", "<div id=\"successMessage\" class=\"alert alert-danger mt-3 col-lg-6\">Old password not correct!</div>");
                    }
                } else {
                    request.setAttribute("mess", "<div id=\"successMessage\" class=\"alert alert-danger mt-3 col-lg-6\">New password and Re password not match!</div>");
                    warn = "New password and Re password not match";
                }
                request.setAttribute("warn", warn);
                break;
            case "delete":
                String idDelete = request.getParameter("deleteid");
                UserDAO.INSTANCE.deleteUser(idDelete);
                request.getRequestDispatcher("login").forward(request, response);
                break;
        }
        request.setAttribute("content", "profile");
        request.getRequestDispatcher("/shipper").forward(request, response);
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
