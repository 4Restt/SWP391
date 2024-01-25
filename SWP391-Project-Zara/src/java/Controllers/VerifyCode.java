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

/**
 *
 * @author ManhPhuc
 */
public class VerifyCode extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyCode</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyCode at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newpass = request.getParameter("newpassword");
        String repassword = request.getParameter("repassword");
        HttpSession ses = request.getSession();
        User user = (User)ses.getAttribute("account");
        if (!newpass.equals(repassword)) {
            String warn = "Please Check again to confirm the new password ";
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/ChangePass.jsp").forward(request, response);
        } else {
            UserDAO.INSTANCE.ChangeUser(newpass,UserDAO.INSTANCE.getUser().getName());
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        }
//                    request.getRequestDispatcher("Views/VerifyCode.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        String code = (String) ses.getAttribute("code");
        String code1 = request.getParameter("code");
        if (!code.equals(code1)) {
            String warn = "Please check the Code we sent ";
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/VerifyCode.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("Views/ChangePass.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
