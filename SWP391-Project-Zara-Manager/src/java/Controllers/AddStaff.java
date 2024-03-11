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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

@MultipartConfig
public class AddStaff extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        if (user == null) {
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        }
        request.setAttribute("profile", UserDAO.INSTANCE.getUserById(user.getId()));
        request.setAttribute("imgAfterUp", null);
        List<User> listStaff = UserDAO.INSTANCE.getListStaff();
        request.setAttribute("listStaff", listStaff);
        request.getRequestDispatcher("Views/AddStaff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String img = request.getParameter("image");
        if(img.isEmpty()){
            img = "images/profile-image-default.jpg";
        }  
        UserDAO.INSTANCE.addNewStaff(username, password, name, phone, address, email, img);
         List<User> listStaff = UserDAO.INSTANCE.getListStaff();
        request.setAttribute("listStaff", listStaff);
        request.getRequestDispatcher("Views/AddStaff.jsp").forward(request, response);


        
        
                
         
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
