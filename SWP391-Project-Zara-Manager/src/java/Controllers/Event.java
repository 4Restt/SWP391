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
import Models.SaleEvent;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ManhPhuc
 */
public class Event extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Event</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Event at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> listProduct = ProductDAO.INSTANCE.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("Views/Event.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("nameevent");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        Float percent = Float.parseFloat(request.getParameter("percent"));
        String[] proid= request.getParameterValues("selectedProducts");
        for (String id : proid) {
//        ProductDAO.INSTANCE.getProductByPid(id);
        List<Product> listProducts = ProductDAO.INSTANCE.getProductByPid(id);

        float newprice = 0;

        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startdate, dateFormatter);
        LocalDate endDate = LocalDate.parse(enddate, dateFormatter);
        boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
                || currentTime.toLocalDate().isBefore(startDate);
        if (isWithinTimeRange) {
            newprice = listProducts.get(0).getPrice();

        } else {
            newprice = listProducts.get(0).getPrice() * (1 - percent);
        }
        ProductDAO.INSTANCE.UpdatePrice(newprice, Integer.parseInt(id));
        SaleDAO.INSTANCE.InsertSaleEvent(startdate, enddate, name);
        SaleDAO.INSTANCE.getIdSaleEvent(startdate, enddate, name);
        SaleEvent sale = SaleDAO.INSTANCE.getSale();
        SaleDAO.INSTANCE.InsertSale(sale.getId(), id, percent);
        }

        List<Product> listProduct = ProductDAO.INSTANCE.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("Views/Event.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
