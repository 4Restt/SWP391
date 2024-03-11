/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditStaff extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        if(user == null){
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        }
//                try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//      
//            out.println("<h1>Servlet sad at " + UserDAO.INSTANCE.getUserById(user.getId()).getId() + "</h1>");
//            
//        }
        request.setAttribute("profile", UserDAO.INSTANCE.getUserById(user.getId()));
//        
        request.getRequestDispatcher("Views/EditStaff.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String img = request.getParameter("image");
        String imgBackUp = request.getParameter("imageBackUp");
        if(imgBackUp.isEmpty()){
            imgBackUp = "images/profile-image-default.jpg";
        }
        if(img.isEmpty()){
            img = imgBackUp;
        }  
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        if (user == null) {
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        }
        request.setAttribute("profile", UserDAO.INSTANCE.getUserById(user.getId()));
        UserDAO.INSTANCE.editStaff(id, username, password, name, phone, address, email, img);
        request.getRequestDispatcher("stafflist").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
