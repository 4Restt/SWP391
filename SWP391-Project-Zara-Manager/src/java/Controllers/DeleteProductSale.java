/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.*;
import Models.Product;
import Models.ProductSale;
import Models.SaleEvent;
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
public class DeleteProductSale extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteProductSale</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteProductSale at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String proid = request.getParameter("proid");
        String saleid = request.getParameter("saleid");
        int saleid1 = Integer.parseInt(request.getParameter("saleid"));
        SaleDAO.INSTANCE.DeactivateSalePro(saleid1, Integer.parseInt(proid));
//        SaleDAO.INSTANCE.DeleteSaleByProid(Integer.parseInt(proid));
        Float pricedefault = Float.parseFloat(request.getParameter("pricedefault"));
        ProductDAO.INSTANCE.UpdatePrice(pricedefault, Integer.parseInt(proid));

        request.setAttribute("saleid", saleid);
        request.setAttribute("product", ProductDAO.INSTANCE.getAllProduct());
        request.setAttribute("sl", ProductSaleDAO.INSTANCE.getProductSaleBySaleEventId(saleid1));
        request.setAttribute("productsale", ProductSaleDAO.INSTANCE.listAllProductSaleBySaleId(saleid));
        request.getRequestDispatcher("Views/EditSale.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int saleeventid = Integer.parseInt(request.getParameter("saleid"));
        String saleid = request.getParameter("saleid");
        String name = request.getParameter("name");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String[] proid = request.getParameterValues("selectedProducts");
        String percent1 = request.getParameter("percent1");
        percent1 = percent1.substring(0, percent1.length() - 1);
        Float percent = Float.parseFloat(percent1) / 100;
        float newprice = 0;
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startdate, dateFormatter);
        LocalDate endDate = LocalDate.parse(enddate, dateFormatter);
        SaleDAO.INSTANCE.updateSaleEvent(saleeventid, startdate, enddate, name);

        List<ProductSale> sale = ProductSaleDAO.INSTANCE.listAllProductSaleBySaleId(saleid);
        for (ProductSale sl : sale) {
            boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
                    || currentTime.toLocalDate().isBefore(startDate);
            if (isWithinTimeRange) {
                newprice = sl.getPrice();
            } else {
                newprice = sl.getPrice() * (1 - percent);
            }
            ProductDAO.INSTANCE.UpdatePrice(newprice, sl.getProinforId());
            SaleDAO.INSTANCE.UpdateSalePercentBySaId(percent, saleeventid);
        }

        if (proid != null) {
            for (String id : proid) {
                SaleDAO.INSTANCE.InsertSale(saleeventid, id, percent);
//            SaleDAO.INSTANCE.UpdateSale(Integer.parseInt(id), percent, saleeventid);
                boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
                        || currentTime.toLocalDate().isBefore(startDate);
                if (isWithinTimeRange) {
                    newprice = ProductDAO.INSTANCE.getProductByPid(id).get(0).getPriceDefault();
                } else {
                    newprice = ProductDAO.INSTANCE.getProductByPid(id).get(0).getPriceDefault() * (1 - percent);
                }
                ProductDAO.INSTANCE.UpdatePrice(newprice, Integer.parseInt(id));
            }
        }

        List<Product> listProduct = ProductDAO.INSTANCE.getAllProduct();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("sale", SaleDAO.INSTANCE.getAllListEvent());
        request.setAttribute("prosale", ProductSaleDAO.INSTANCE.listAllProductSale());
        request.getRequestDispatcher("Views/SaleList.jsp").forward(request, response);

//            String percent1 = request.getParameter("percent1");
//            percent1 = percent1.substring(0, percent1.length() - 1);
//            Float percent = Float.parseFloat(percent1)/100;
//        try ( PrintWriter out = response.getWriter()) {
//            out.println(percent1);
//
//        }
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
