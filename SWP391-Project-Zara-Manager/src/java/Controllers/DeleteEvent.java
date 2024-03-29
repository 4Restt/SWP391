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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startdate, dateFormatter);
        LocalDate endDate = LocalDate.parse(enddate, dateFormatter);
        boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
                || currentTime.toLocalDate().isBefore(startDate);
        if (isWithinTimeRange) {
            SaleDAO.INSTANCE.DeactivateSale(saleid);
        } else {
          request.setAttribute("warn", "An active SaleEvent cannot be Deactivated");
        }
        
        List<Product> listProduct = ProductDAO.INSTANCE.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("sale", SaleDAO.INSTANCE.getAllListEvent());
        request.setAttribute("prosale", ProductSaleDAO.INSTANCE.listAllProductSale());
        request.getRequestDispatcher("Views/SaleList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int saleid = Integer.parseInt(request.getParameter("saleid"));
        ProductSale pro = ProductSaleDAO.INSTANCE.getProductSaleBySaleEventId(saleid);
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        SaleDAO.INSTANCE.ActivateSale(saleid);
        List<Product> listProduct = ProductDAO.INSTANCE.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("sale", SaleDAO.INSTANCE.getAllListEvent());
        request.setAttribute("prosale", ProductSaleDAO.INSTANCE.listAllProductSale());
        request.getRequestDispatcher("Views/SaleList.jsp").forward(request, response);

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
