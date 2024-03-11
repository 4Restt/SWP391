/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import DAL.StyleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ManhPhuc
 */
public class Filter extends HttpServlet {

    String[] style = new String[1000];
    String[] size = new String[1000];

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    List<String> search = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sql = "WITH RankedProducts AS (\n"
                + "	 SELECT P.product_info_id, P.size, P.color, P.name, P.quantity,\n"
                + "	 PI.price_sale, PI.img_default,C.id as catid, S.id as [sid],\n"
                + "	ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY CASE \n"
                + "                                    WHEN P.size = 'S' THEN 0 \n"
                + "                                    WHEN P.size = 'M' THEN 1 \n"
                + "                                    WHEN P.size = 'L' THEN 2 \n"
                + "                                    WHEN P.size = 'XL' THEN 3 \n"
                + "                                    ELSE 4\n"
                + "                                     END) AS rn\n"
                + "	FROM  Product P\n"
                + "	JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "	JOIN Style S ON PI.style_id = S.id\n"
                + "	JOIN Category C ON S.cate_id = C.id\n"
                + ")\n"
                + "SELECT product_info_id, size, color, name,\n"
                + "quantity, price_sale, img_default, catid\n"
                + "FROM RankedProducts WHERE rn = 1 and ";
        String s = "";
        String catid = request.getParameter("catid");
        style = request.getParameterValues("style");
        if (style != null) {
            String s2 = "catid = ? ";
            String s1 = "And( ";
//            s += " And ";
            for (int i = 0; i < style.length; i++) {
                s1 += "[sid] = ? or ";
            }
            s1 += "0=1";
            s1 += ")";
            sql += s2;
            sql += s1;
        } else if (style == null) {
            String s2 = "catid = ?";
            sql += s2;
        }

        String price = request.getParameter("price");
        if (price != null) {
            s += " And( ";
            if (price.equals("value1")) {
                s += "(price_sale < 100) or ";
            } else if (price.equals("value2")) {
                s += "(price_sale between 100 and 149) or ";
            } else if (price.equals("value3")) {
                s += "(price_sale between 150 and 200) or ";
            } else if (price.equals("value4")) {
                s += "(price_sale > 200) or ";
            }
            s += "0=1";
            s += " )";
        }
        sql += s;

        if (style == null) {
            ProductDAO.INSTANCE.SearchFilter1(catid, sql);
        } else if (style != null) {
            ProductDAO.INSTANCE.SearchFilter(style, catid, sql);
        }

        if (ProductDAO.INSTANCE.getListProduct().isEmpty()) {
            request.setAttribute("warn", "The product you are looking for is not available in our store");
            request.getRequestDispatcher("Views/Shop.jsp").forward(request, response);
        } else {
            request.setAttribute("catid", catid);
            StyleDAO.INSTANCE.getAllStyleByCateId(catid);
            request.setAttribute("style", StyleDAO.INSTANCE.getSt());
            request.setAttribute("listProduct", ProductDAO.INSTANCE.getListProduct());
            CategoryDAO.INSTANCE.getAllCategory();
            request.setAttribute("cat", CategoryDAO.INSTANCE.getListCategory());
            request.getRequestDispatcher("Views/Shop.jsp").forward(request, response);
        }
//        try ( PrintWriter out = response.getWriter()) {
//            out.println(sql);
//            out.println(ProductDAO.INSTANCE.getListProduct().toString());
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        search.add("name");
        search.add("description");
        search.add("color");
        search.add("size");
        String key = request.getParameter("txt");
        String sql = "WITH RankedProducts AS (\n"
                + "	 SELECT P.product_info_id, P.size, P.color, P.name, P.quantity,\n"
                + "	 PI.description, PI.price_sale, PI.img_default,C.id as catid,\n"
                + "	ROW_NUMBER() OVER (PARTITION BY P.product_info_id ORDER BY CASE \n"
                + "                                    WHEN P.size = 'S' THEN 0 \n"
                + "                                    WHEN P.size = 'M' THEN 1 \n"
                + "                                    WHEN P.size = 'L' THEN 2 \n"
                + "                                    WHEN P.size = 'XL' THEN 3 \n"
                + "                                    ELSE 4\n"
                + "                                     END) AS rn\n"
                + "	FROM  Product P\n"
                + "	JOIN ProductInfor PI ON P.product_info_id = PI.id\n"
                + "	JOIN Style S ON PI.style_id = S.id\n"
                + "	JOIN Category C ON S.cate_id = C.id\n"
                + ")\n"
                + "SELECT product_info_id, size, color, name,\n"
                + "quantity, description, price_sale, img_default, catid\n"
                + "FROM RankedProducts WHERE rn = 1 and ";
        String s = "";
        String catid = request.getParameter("category");
        String price = request.getParameter("price");
        if (catid != null) {
            String s1 = "catid = ? ";
            if (price != null) {
                s += " And( ";
            } else {
                s += "";
            }
            sql += s1;
        } else {
            s += " ( ";
        }

        if (price != null) {
//            s += " And( ";
            if (price.equals("value1")) {
                s += "(price_sale < 100) or ";
            } else if (price.equals("value2")) {
                s += "(price_sale between 100 and 149) or ";
            } else if (price.equals("value3")) {
                s += "(price_sale between 150 and 200) or ";
            } else if (price.equals("value4")) {
                s += "(price_sale > 200) or ";
            }
            s += "0=1";
            s += " )";
        }

        sql += s;

        String txt = " And(";
        for (String a : search) {
            txt += "[" + a + "] like CONCAT ('%',?,'%') or ";
        }
        txt = txt.substring(0, txt.length() - 4);
        sql += txt;
        sql += ")";
        if (catid != null) {
            ProductDAO.INSTANCE.Search1(catid, key, sql, search.size());
        } else if (catid == null) {
            ProductDAO.INSTANCE.Search2(key, sql, search.size());
        }

        if (ProductDAO.INSTANCE.getListProduct().isEmpty()) {
            request.setAttribute("warn", "The product you are looking for is not available in our store");
            CategoryDAO.INSTANCE.getAllCategory();
            request.setAttribute("cat", CategoryDAO.INSTANCE.getListCategory());
            request.getRequestDispatcher("Views/Search.jsp").forward(request, response);

        } else {
            request.setAttribute("catid", catid);
            request.setAttribute("txt", key);

            request.setAttribute("listProduct", ProductDAO.INSTANCE.getListProduct());
            CategoryDAO.INSTANCE.getAllCategory();
            request.setAttribute("cat", CategoryDAO.INSTANCE.getListCategory());
            CategoryDAO.INSTANCE.getAllCategory();
            request.setAttribute("listCategory", CategoryDAO.INSTANCE.getListCategory());
            request.getRequestDispatcher("Views/Search.jsp").forward(request, response);
        }
//        try ( PrintWriter out = response.getWriter()) {
//            out.println(sql);
//            out.println(catid);
//        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
