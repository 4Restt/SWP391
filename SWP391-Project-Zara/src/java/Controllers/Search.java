/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.Category;
import DAL.CategoryDAO;
import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ManhPhuc
 */
public class Search extends HttpServlet {

    List<String> search = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        search.add("name");
        search.add("description");
        search.add("color");
        search.add("size");
        String txt = request.getParameter("search");
        String sql = "WITH RankedProducts AS (\n"
                + "	 SELECT P.id, P.product_info_id, P.size,  P.color, P.name, P.quantity, P.description, PI.price, PI.img_default,\n"
                + "	ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY P.id) AS rn\n"
                + "	FROM  Product P\n"
                + "	JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "	JOIN Style S ON PI.style_id = S.id\n"
                + "	JOIN Category C ON S.cate_id = C.id\n"
                + ")\n"
                + "SELECT id, product_info_id, size, color, name, quantity, description, price, img_default FROM RankedProducts WHERE rn = 1 and (";
        String s1 = "";
        for (String s2 : search) {
            s1 += "[" + s2 + "] like CONCAT ('%',?,'%') or ";
        }
        s1 = s1.substring(0, s1.length() - 4);
        sql += s1;
        sql += ")";
        List<Category> cat = CategoryDAO.INSTANCE.getListCategory();
        request.setAttribute("cat", cat);
        ProductDAO.INSTANCE.Search(sql, txt, search.size());
        if (ProductDAO.INSTANCE.getListProduct().isEmpty()) {
            String warn = "The product you are looking for is not available in our store";
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/Shop.jsp").forward(request, response);
        } else {
            request.setAttribute("listProduct", ProductDAO.INSTANCE.getListProduct());
            request.setAttribute("txt", txt);
            request.getRequestDispatcher("Views/Shop.jsp").forward(request, response);
        }
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
