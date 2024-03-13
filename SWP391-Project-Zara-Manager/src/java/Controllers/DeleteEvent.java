/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.ProductDAO;
import DAL.ProductSaleDAO;
import DAL.SaleDAO;
import Models.Product;
import Models.ProductSale;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ManhPhuc
 */
public class DeleteEvent extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteEvent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteEvent at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int saleid = Integer.parseInt(request.getParameter("saleid"));
        ProductSale pro = ProductSaleDAO.INSTANCE.getProductSaleBySaleEventId(saleid);
        try {
            SaleDAO.INSTANCE.DeleteSale(pro.getId(), pro.getProinforId(), pro.getPercent());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        SaleDAO.INSTANCE.DeleteSaleEvent(saleid);
        ProductDAO.INSTANCE.UpdatePrice(pro.getPrice(), pro.getProinforId());
        List<Product> listProduct = ProductDAO.INSTANCE.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("prosale", ProductSaleDAO.INSTANCE.listAllProductSale());
        request.getRequestDispatcher("Views/SaleList.jsp").forward(request, response);
    }

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
