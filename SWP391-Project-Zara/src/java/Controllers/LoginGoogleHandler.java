package Controllers;

import DAL.CustomerDAO;
import Models.Customer;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

public class LoginGoogleHandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String GOOGLE_CLIENT_ID = "937366049176-dvn9qbk5sori7e2eor833mm4pthh3ncc.apps.googleusercontent.com";
    private final static String GOOGLE_CLIENT_SECRET = "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";
    private final static String GOOGLE_REDIRECT_URI = "http://localhost:9999/SWP391-Project-Zara/logingooglehandler";
    private final static String GOOGLE_GRANT_TYPE = "authorization_code";
    private final static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    private final static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);
        Customer account = CustomerDAO.INSTANCE.checkAccountGoogleExist(user.getId());
        HttpSession ses = request.getSession();
        if (account == null) {
            CustomerDAO.INSTANCE.addCustomerGoogle(user.getId(), user.getName(), user.getEmail(), user.getPicture());
            Customer account1 = CustomerDAO.INSTANCE.checkAccountGoogleExist(user.getId());
            ses.setAttribute("account", account1);
            request.getRequestDispatcher("home").forward(request, response);
        } else {
            ses.setAttribute("account", account);
            request.getRequestDispatcher("home").forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GOOGLE_REDIRECT_URI)
                        .add("code", code).add("grant_type", GOOGLE_GRANT_TYPE)
                        .build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        // Đảm bảo sử dụng accessToken một cách đúng đắn trong URL
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken; // Không cần thay đổi ở đây
        String response = Request.Get(link).execute().returnContent().asString();
        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        // Log để kiểm tra kết quả trả về
        System.out.println("Response: " + response);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
