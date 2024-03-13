package Controllers;

import DAL.CategoryDAO;
import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String account = request.getParameter("username");
        String password = request.getParameter("password");
        String warn = "Your account or password is incorrect";
        UserDAO.INSTANCE.logout();
        UserDAO.INSTANCE.login(account, password);
        String remember = request.getParameter("remember");
        if (UserDAO.INSTANCE.getUser() == null) {
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else {
            HttpSession ses = request.getSession();
            ses.setAttribute("account", UserDAO.INSTANCE.getUser());
            Cookie c = new Cookie("userC", account);
            Cookie p = new Cookie("passC", password);
            c.setMaxAge(60);
            if (remember != null) {
                p.setMaxAge(60);
            } else {
                p.setMaxAge(0);
            }

            response.addCookie(c);
            response.addCookie(p);
            response.sendRedirect("home");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Cookie[] arr = request.getCookies();
        if (arr == null) {
            arr = new Cookie[0]; // Assign an empty array if arr is null
        }

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == null) {
                arr[i] = new Cookie("empty", " "); // If arr[i] is null, assign a cookie with a space
            }
        }
        for (Cookie o : arr) {
            if (o.getName().equals("userC")) {
                request.setAttribute("username", o.getValue());
            }
            if (o.getName().equals("passC")) {
                request.setAttribute("password", o.getValue());
            }
        }
        List<Models.Category> listCategory = CategoryDAO.INSTANCE.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String account = request.getParameter("username");
        String password = request.getParameter("password");
        String warn = "Your account or password is incorrect";
        UserDAO.INSTANCE.logout();
        UserDAO.INSTANCE.login(account, password);
        String remember = request.getParameter("remember");
        if (UserDAO.INSTANCE.getUser() == null) {
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else {
            HttpSession ses = request.getSession();
            ses.setAttribute("account", UserDAO.INSTANCE.getUser());
            Cookie c = new Cookie("userC", account);
            Cookie p = new Cookie("passC", password);
            c.setMaxAge(60);
            if (remember != null) {
                p.setMaxAge(60);
            } else {
                p.setMaxAge(0);
            }
            response.addCookie(c);
            response.addCookie(p);
//            request.getRequestDispatcher("Home").forward(request, response);
            if (UserDAO.INSTANCE.getUser().getRollId() == 1) {
                response.sendRedirect("dashboard");
            }
            if((UserDAO.INSTANCE.getUser().getRollId() == 2 && UserDAO.INSTANCE.getUser().getStatus().equals("Activated")) ||
                (UserDAO.INSTANCE.getUser().getRollId() == 3 && UserDAO.INSTANCE.getUser().getStatus().equals("Activated"))){
                response.sendRedirect("home");
            }
            if((UserDAO.INSTANCE.getUser().getRollId() == 2 && UserDAO.INSTANCE.getUser().getStatus().equals("Deactivated")) ||
                (UserDAO.INSTANCE.getUser().getRollId() == 3 && UserDAO.INSTANCE.getUser().getStatus().equals("Deactivated"))){
                warn = "This account has been deactivated";
                request.setAttribute("warn", warn);
                request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
            }
            

        }
//            response.sendRedirect("Views/Login.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
