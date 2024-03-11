/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.Category;
import DAL.CategoryDAO;
import DAL.ProductDAO;
import DAL.StyleDAO;
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
        String txt = request.getParameter("txt");
        String sql = "WITH RankedProducts AS (\n"
                + "	 SELECT P.product_info_id, P.size,  P.color, P.name, P.quantity,"
                + " PI.description, PI.price_sale, PI.img_default,\n"
                + "	ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY PI.id) AS rn\n"
                + "	FROM  Product P\n"
                + "	JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "	JOIN Style S ON PI.style_id = S.id\n"
                + "	JOIN Category C ON S.cate_id = C.id\n"
                + ")\n"
                + "SELECT product_info_id, size, color, name, quantity, "
                + "description, price_sale, img_default FROM RankedProducts WHERE rn = 1 and (";
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
            request.getRequestDispatcher("Views/Search.jsp").forward(request, response);
        } else {
            request.setAttribute("txt", txt);
            request.setAttribute("listProduct", ProductDAO.INSTANCE.getListProduct());
            request.getRequestDispatcher("Views/Search.jsp").forward(request, response);
        }
//        try ( PrintWriter out = response.getWriter()) {
//            out.println(sql);
//            out.println(txt);
//            out.println(ProductDAO.INSTANCE.getListProduct().toString());
//        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String catid = request.getParameter("id");
        ProductDAO.INSTANCE.SearchByCategory(catid);
        CategoryDAO.INSTANCE.getAllCategory();
        request.setAttribute("cat", CategoryDAO.INSTANCE.getListCategory());
        if (ProductDAO.INSTANCE.getListProduct().isEmpty()) {
            String warn = "The product you are looking for is not available in our store";
            request.setAttribute("warn", warn);
            request.getRequestDispatcher("Views/Search.jsp").forward(request, response);
        } else {
            request.setAttribute("catid", catid);
            request.setAttribute("listProduct", ProductDAO.INSTANCE.getListProduct());
            request.getRequestDispatcher("Views/Search.jsp").forward(request, response);

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
