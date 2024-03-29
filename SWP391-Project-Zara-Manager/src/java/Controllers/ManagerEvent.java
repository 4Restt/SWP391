/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAL.ProductDAO;
import DAL.ProductSaleDAO;
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
public class ManagerEvent extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerEvent</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerEvent at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String saleid = request.getParameter("saleid");
        request.setAttribute("saleid", saleid);
        int saleid1 = Integer.parseInt(request.getParameter("saleid"));
        
        List<ProductSale> prosale = ProductSaleDAO.INSTANCE.listAllProductSaleBySaleId(saleid);
        for (ProductSale pro : prosale) {
        String startdate = pro.getStartdate();
        String enddate =  pro.getEnddate();    
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startdate, dateFormatter);
        LocalDate endDate = LocalDate.parse(enddate, dateFormatter);
        boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
                || currentTime.toLocalDate().isBefore(startDate);
        if (isWithinTimeRange) {
            ProductDAO.INSTANCE.UpdatePrice(pro.getPrice(), pro.getProinforId());
        } else {
            ProductDAO.INSTANCE.UpdatePrice(pro.getPrice()*(1-pro.getPercent()), pro.getProinforId());
        }
        }
        
        
        
        
        request.setAttribute("sl", ProductSaleDAO.INSTANCE.getProductSaleBySaleEventId(saleid1));        
        request.setAttribute("productsale", ProductSaleDAO.INSTANCE.listAllProductSaleBySaleId(saleid));
        request.setAttribute("product", ProductDAO.INSTANCE.getAllProduct());        
        request.getRequestDispatcher("Views/EditSale.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
