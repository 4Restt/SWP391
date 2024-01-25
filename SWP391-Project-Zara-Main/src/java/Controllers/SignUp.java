
package Controllers;
import DAL.CategoryDAO;
import DAL.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

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
        } else {
            UserDAO.INSTANCE.checkAccountExist(username);
            if (UserDAO.INSTANCE.getUser()== null) {
                UserDAO.INSTANCE.signUp(username, password, name, phone, address, email);
                response.sendRedirect("login");
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
