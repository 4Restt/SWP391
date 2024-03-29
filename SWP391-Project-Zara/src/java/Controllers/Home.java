/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import DAL.ProductSaleDAO;
import Helper.MemCached;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Models.Category;
import Models.Customer;
import Models.Product;
import Models.ProductSale;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Home extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//
//        LocalDateTime currentTime = LocalDateTime.now();
//        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        List<Product> products = ProductDAO.INSTANCE.getAllProduct();
//        for (Product product : products) {
//            ProductSale productSale = ProductSaleDAO.INSTANCE.getProductSaleByProinfoId(product.getProductInfoId());
//            if (productSale != null) {
//                LocalDate startDate = LocalDate.parse(productSale.getStartdate(), dateFormatter);
//                LocalDate endDate = LocalDate.parse(productSale.getEnddate(), dateFormatter);
//
//                boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
//                        || currentTime.toLocalDate().isBefore(startDate);
//
//                if (isWithinTimeRange) {
//                    float newPrice = product.getPrice();
//                    ProductDAO.INSTANCE.UpdatePrice(newPrice, productSale.getProinforId());
//                }
//            }
//        }
        
        Customer customer = (Customer) request.getSession().getAttribute("account");

        List<Category> listCategory = CategoryDAO.INSTANCE.getAllCategory();
        List<Product> listNewArrival = ProductDAO.INSTANCE.getTop6NewArrival();
        List<Product> listBestSelling = ProductDAO.INSTANCE.getBestSellingProduct();
        List<Models.Cart> cart_list = customer == null ? null : MemCached.mem.get(customer.getId());
        int totalQ = 0;
        if (cart_list != null) {
            for (Models.Cart c : cart_list) {
                totalQ += c.getQuantity();
            }
        }

        request.setAttribute("totalQ", totalQ);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listNewArrival", listNewArrival);
        request.setAttribute("listBestSelling", listBestSelling);
        request.getRequestDispatcher("Views/Home.jsp").forward(request, response);
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
    }
}
