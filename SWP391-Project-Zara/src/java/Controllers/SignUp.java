package Controllers;

import DAL.CategoryDAO;
import DAL.CustomerDAO;
import DAL.UserDAO;
import Models.Customer;
import Models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import units.email;

public class SignUp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Models.Category> listCategory = CategoryDAO.INSTANCE.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("Views/SignUp.jsp").forward(request, response);
    }

    private boolean containsWhiteSpace(String str) {
        return str != null && str.trim().contains(" ");
    }

    private String generateRandomCode() {
        return UUID.randomUUID().toString();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String warn = "Your account is existed. Please register again!!!";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        if (!password.equals(repassword)) {
            warn = "Password and Re-password do not match!!! ";
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/SignUp.jsp").forward(request, response);
        } else if (containsWhiteSpace(password) || containsWhiteSpace(repassword)) {
            warn = "Password and Re-password must not contain spaces!!! ";
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/SignUp.jsp").forward(request, response);
        } else {
            CustomerDAO.INSTANCE.checkAccountExist(username);
            Customer u = CustomerDAO.INSTANCE.checkEmailExist1(email);
            if (CustomerDAO.INSTANCE.getCustomer() == null || u == null) {
                HttpSession ses = request.getSession();
                String verificationCode = generateRandomCode();
                ses.setAttribute("code", verificationCode);
                try {
                    email e = new email();
                    e.send(email, "Verification Code", "Your verification code is: "
                            + verificationCode);
                    request.setAttribute("email", email);
                } catch (MessagingException ex) {
                    Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("username",username);
                request.setAttribute("password",password);
                request.setAttribute("name",name);
                request.setAttribute("email",email);
                request.setAttribute("address",address);
                request.setAttribute("phone",phone);
                request.getRequestDispatcher("Views/VerifyCode.jsp").forward(request, response);

//                UserDAO.INSTANCE.signUp(username, password, name, phone, address, email);
//                response.sendRedirect("login");
            } else {
                request.setAttribute("warn", warn);
                request.getRequestDispatcher("Views/SignUp.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
