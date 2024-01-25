/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.UserDAO;
import jakarta.servlet.ServletContext;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.UUID;


public class ForgotPass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/ForgotPass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        UserDAO.INSTANCE.checkEmailExist(email);
        if (UserDAO.INSTANCE.getUser() == null) {
            String warn = "Your email is not registered in the system";
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/ForgotPass.jsp").forward(request, response);
        } else {
            String verificationCode = generateRandomCode();
            HttpSession ses = request.getSession();
            ses.setAttribute("user", UserDAO.INSTANCE.getUser());
            ses.setAttribute("code", verificationCode);
            String host = "smtp.gmail.com";
            String port = "587";
            final String username = "khongmanhphuc2003@gmail.com";
            final String password = "qecy mbsn zdra sotu";
            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email));
                message.setSubject("Verification Code");
                message.setText("Your verification code is: " + verificationCode);
                Transport.send(message);
                System.out.println("Email sent successfully!");

            } catch (MessagingException e) {
            }
            request.getRequestDispatcher("Views/VerifyCode.jsp").forward(request, response);
        }

    }

    private String generateRandomCode() {
        return UUID.randomUUID().toString();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
