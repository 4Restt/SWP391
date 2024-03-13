package Controllers;

import DAL.CategoryDAO;
import DAL.DeliveryDAO;
import DAL.ShipperDAO;
import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        String remember = request.getParameter("remember");

        String warn = "Your account or password is incorrect";
        Object user = null;
        Object sessionNameAttribute = null;

        if (account != null && password != null) {
            // Try logging in as Delivery
            DeliveryDAO.INSTANCE.logout();
            DeliveryDAO.INSTANCE.login(account, password);
            user = DeliveryDAO.INSTANCE.getDelivery();
            sessionNameAttribute = "deliveryName";

            if (user == null) {
                // If not a delivery, try logging in as Shipper
                ShipperDAO.INSTANCE.logout();
                ShipperDAO.INSTANCE.login(account, password);
                user = ShipperDAO.INSTANCE.getShipper();
                sessionNameAttribute = "shipperName";
            }
        }

        if (user == null) {
            // If no user found, forward to login page with warning
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else {
            // If user found, set session attributes and cookies
            HttpSession session = request.getSession();
            session.setAttribute("account", user);
            session.setAttribute(sessionNameAttribute.toString(), account);

            try {
                // Encode account and password before creating cookies
                Cookie userCookie = new Cookie("userC", URLEncoder.encode(account, "UTF-8"));
                Cookie passCookie = new Cookie("passC", URLEncoder.encode(password, "UTF-8"));

                userCookie.setMaxAge(60);
                if (remember != null) {
                    passCookie.setMaxAge(60);
                } else {
                    passCookie.setMaxAge(0);
                }

                response.addCookie(userCookie);
                response.addCookie(passCookie);
            } catch (UnsupportedEncodingException e) {
                // Handle encoding exception
                e.printStackTrace();
            }

            // Forward to the appropriate role-specific page
            if (sessionNameAttribute.equals("deliveryName")) {
                request.getRequestDispatcher("/delivery").forward(request, response);
            } else {
                request.getRequestDispatcher("/shipper").forward(request, response);
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
