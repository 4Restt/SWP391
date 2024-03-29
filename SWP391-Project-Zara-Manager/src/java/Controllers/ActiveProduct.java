/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.ProductDAO;
import DAL.ProductSaleDAO;
import DAL.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author ManhPhuc
 */
public class ActiveProduct extends HttpServlet {

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
            out.println("<title>Servlet ActiveProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActiveProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String proid = request.getParameter("proid");
        String saleid = request.getParameter("saleid");
        int saleid1 = Integer.parseInt(request.getParameter("saleid"));
        SaleDAO.INSTANCE.ActivateSalePro(saleid1, Integer.parseInt(proid));
        Float pricedefault = Float.parseFloat(request.getParameter("pricedefault"));
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        Float percent = Float.parseFloat(request.getParameter("percent"));
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startdate, dateFormatter);
        LocalDate endDate = LocalDate.parse(enddate, dateFormatter);
        boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
                || currentTime.toLocalDate().isBefore(startDate);
        if (isWithinTimeRange) {
            ProductDAO.INSTANCE.UpdatePrice(pricedefault, Integer.parseInt(proid));
        } else {
            ProductDAO.INSTANCE.UpdatePrice(pricedefault*(1-percent), Integer.parseInt(proid));
        }

        request.setAttribute("saleid", saleid);
        request.setAttribute("product", ProductDAO.INSTANCE.getAllProduct());
        request.setAttribute("sl", ProductSaleDAO.INSTANCE.getProductSaleBySaleEventId(saleid1));
        request.setAttribute("productsale", ProductSaleDAO.INSTANCE.listAllProductSaleBySaleId(saleid));
        request.getRequestDispatcher("Views/EditSale.jsp").forward(request, response);
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
