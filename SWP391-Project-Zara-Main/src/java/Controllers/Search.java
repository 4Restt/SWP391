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
        search.add("descrisption");
        search.add("price");
        search.add("size");
        search.add("color");
        String txt = request.getParameter("search");
        String sql = "select * from Products where ";
        String s1 = "";
        for (String s2 : search) {
            s1 += "[" + s2 + "] like CONCAT ('%',?,'%') or ";
        }
        s1 = s1.substring(0, s1.length() - 4);
        sql += s1;
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
