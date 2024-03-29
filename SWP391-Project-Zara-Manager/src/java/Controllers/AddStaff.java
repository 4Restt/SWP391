package Controllers;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.MessagingException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import units.email;

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
        email e = new email();
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String img = request.getParameter("image");
        if (img.isEmpty()) {
            img = "images/profile-image-default.jpg";
        }

        try {
            if (UserDAO.INSTANCE.checkEmailExist1(email) != null) {
                response.getWriter().write("Email already exists.");
                return;
            } else if (UserDAO.INSTANCE.checkAccountExist1(username) != null) {
                response.getWriter().write("Username already exists.");
                return;
            } else if (UserDAO.INSTANCE.checkPhoneExist(phone) != null) {
                response.getWriter().write("Phone number already exists.");
                return;
            } else {
                if (!email.isEmpty()) {
                    e.addStaffSend(email, username, password);
                }
                UserDAO.INSTANCE.addNewStaff(username, password, name, phone, address, email, img);
                response.getWriter().write("success");
                return;
            }
        } catch (MessagingException ex) {
            Logger.getLogger(AddStaff.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().write("Error sending email. Staff member added successfully.");
        }
        
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
    public String getServletInfo() {
        return "Short description";
    }

}
