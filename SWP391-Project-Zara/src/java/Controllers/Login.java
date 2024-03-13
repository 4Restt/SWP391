
package Controllers;
import DAL.CategoryDAO;
import DAL.CustomerDAO;
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
        CustomerDAO.INSTANCE.logout();
        CustomerDAO.INSTANCE.login(account, password);
        String remember = request.getParameter("remember");
        if (CustomerDAO.INSTANCE.getCustomer() == null) {
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else {
            HttpSession ses = request.getSession();
            ses.setAttribute("account", CustomerDAO.INSTANCE.getCustomer());
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
        Cookie arr[] = request.getCookies();
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
        CustomerDAO.INSTANCE.logout();
        CustomerDAO.INSTANCE.login(account, password);
        String remember = request.getParameter("remember");
        if (CustomerDAO.INSTANCE.getCustomer() == null) {
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else {
            HttpSession ses = request.getSession();
            ses.setAttribute("account", CustomerDAO.INSTANCE.getCustomer());
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
//            response.sendRedirect("Views/Login.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

