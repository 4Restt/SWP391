/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.*;
import DAL.ProductDAO;
import DAL.ProductSaleDAO;
import Helper.MemCached;
import Models.*;
import Models.Product;
import Models.ProductSale;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import units.email;

/**
 *
 * @author ManhPhuc
 */
public class MethodPayment extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        request.setAttribute("total", "fsdfdsf");
//        request.getRequestDispatcher("/paymentcontroller").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        List<Product> products = ProductDAO.INSTANCE.getAllProduct();
        for (Product product : products) {
            ProductSale productSale = ProductSaleDAO.INSTANCE.getProductSaleByProinfoId(product.getProductInfoId());
            if (productSale != null) {
                LocalDate startDate = LocalDate.parse(productSale.getStartdate(), dateFormatter);
                LocalDate endDate = LocalDate.parse(productSale.getEnddate(), dateFormatter);

                boolean isWithinTimeRange = currentTime.toLocalDate().isAfter(endDate)
                        || currentTime.toLocalDate().isBefore(startDate);

                if (isWithinTimeRange) {
                    float newPrice = product.getPrice();
                    ProductDAO.INSTANCE.UpdatePrice(newPrice, productSale.getProinforId());
                }
            }
        }

        List<Delivery> de = (List) DeliveryDAO.INSTANCE.getListDelivery();
        request.setAttribute("de", de);
        HttpSession session = request.getSession();
        Customer customer = (Customer) request.getSession().getAttribute("account");
        ArrayList<Models.Cart> cart_list = (ArrayList<Models.Cart>) MemCached.mem.get(customer.getId());
        List<Models.Cart> cartProduct = ProductDAO.INSTANCE.getCartProduct(cart_list);
        request.setAttribute("cartProduct", cartProduct);
        String total = request.getParameter("total");
        request.setAttribute("total", total);
        request.getRequestDispatcher("Views/CheckOut.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Customer cus = (Customer) ses.getAttribute("account");
        ArrayList<Models.Cart> cart_list = (ArrayList<Models.Cart>) MemCached.mem.get(cus.getId());
        String payment = request.getParameter("payment");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String name = fname + " " + lname;
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        String email = cus.getEmail();

        String total = request.getParameter("total");
        int deliveryid = Integer.parseInt(request.getParameter("delivery"));
        request.setAttribute("name", name);
        request.setAttribute("address", address);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);
        request.setAttribute("total", total);
        List<Models.Cart> cartProduct = ProductDAO.INSTANCE.getCartProduct(cart_list);
        request.setAttribute("cartProduct", cartProduct);
        OrderDAO.INSTANCE.AddOrder(cus.getId(), deliveryid, Float.parseFloat(total));
        Order order = OrderDAO.INSTANCE.GetOrder(cus.getId());

        for (Models.Cart cart : cartProduct) {
            OrderDetailDAO.INSTANCE.AddOrderDetail(order.getId(), cart.getProductInfoId(),
                    cart.getSize(), cart.getColor(), cart.getQuantity(), cart.getPrice());
            Product pro = ProductDAO.INSTANCE.getProductByPid2(String.valueOf(cart.getProductInfoId()), cart.getSize(), cart.getColor()).get(0);
            ProductDAO.INSTANCE.UpdateProductQuantity((pro.getQuantity() - cart.getQuantity()),
                    cart.getProductInfoId(), cart.getSize(), cart.getColor());
        }
        if (payment.equals("received")) {
            CustomerDAO.INSTANCE.UpdateInfor(name, address, phone, cus.getId());

            String content = "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "<head>\n"
                    + "\n"
                    + "  <meta charset=\"utf-8\">\n"
                    + "  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n"
                    + "  <title>Email Receipt</title>\n"
                    + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                    + "  <style type=\"text/css\">\n"
                    + "  /**\n"
                    + "   * Google webfonts. Recommended to include the .woff version for cross-client compatibility.\n"
                    + "   */\n"
                    + "  @media screen {\n"
                    + "    @font-face {\n"
                    + "      font-family: 'Source Sans Pro';\n"
                    + "      font-style: normal;\n"
                    + "      font-weight: 400;\n"
                    + "      src: local('Source Sans Pro Regular'), local('SourceSansPro-Regular'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format('woff');\n"
                    + "    }\n"
                    + "\n"
                    + "    @font-face {\n"
                    + "      font-family: 'Source Sans Pro';\n"
                    + "      font-style: normal;\n"
                    + "      font-weight: 700;\n"
                    + "      src: local('Source Sans Pro Bold'), local('SourceSansPro-Bold'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format('woff');\n"
                    + "    }\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Avoid browser level font resizing.\n"
                    + "   * 1. Windows Mobile\n"
                    + "   * 2. iOS / OSX\n"
                    + "   */\n"
                    + "  body,\n"
                    + "  table,\n"
                    + "  td,\n"
                    + "  a {\n"
                    + "    -ms-text-size-adjust: 100%; /* 1 */\n"
                    + "    -webkit-text-size-adjust: 100%; /* 2 */\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Remove extra space added to tables and cells in Outlook.\n"
                    + "   */\n"
                    + "  table,\n"
                    + "  td {\n"
                    + "    mso-table-rspace: 0pt;\n"
                    + "    mso-table-lspace: 0pt;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Better fluid images in Internet Explorer.\n"
                    + "   */\n"
                    + "  img {\n"
                    + "    -ms-interpolation-mode: bicubic;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Remove blue links for iOS devices.\n"
                    + "   */\n"
                    + "  a[x-apple-data-detectors] {\n"
                    + "    font-family: inherit !important;\n"
                    + "    font-size: inherit !important;\n"
                    + "    font-weight: inherit !important;\n"
                    + "    line-height: inherit !important;\n"
                    + "    color: inherit !important;\n"
                    + "    text-decoration: none !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Fix centering issues in Android 4.4.\n"
                    + "   */\n"
                    + "  div[style*=\"margin: 16px 0;\"] {\n"
                    + "    margin: 0 !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  body {\n"
                    + "    width: 100% !important;\n"
                    + "    height: 100% !important;\n"
                    + "    padding: 0 !important;\n"
                    + "    margin: 0 !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Collapse table borders to avoid space between cells.\n"
                    + "   */\n"
                    + "  table {\n"
                    + "    border-collapse: collapse !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  a {\n"
                    + "    color: #1a82e2;\n"
                    + "  }\n"
                    + "\n"
                    + "  img {\n"
                    + "    height: auto;\n"
                    + "    line-height: 100%;\n"
                    + "    text-decoration: none;\n"
                    + "    border: 0;\n"
                    + "    outline: none;\n"
                    + "  }\n"
                    + "  </style>\n"
                    + "\n"
                    + "</head>\n"
                    + "<body style=\"background-color: #D2C7BA;\">\n"
                    + "\n"
                    + "  <!-- start preheader -->\n"
                    + "  <div class=\"preheader\" style=\"display: none; max-width: 0; max-height: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opacity: 0;\">\n"
                    + "    A preheader is the short summary text that follows the subject line when an email is viewed in the inbox.\n"
                    + "  </div>\n"
                    + "  <!-- end preheader -->\n"
                    + "\n"
                    + "  <!-- start body -->\n"
                    + "  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
                    + "\n"
                    + "    <!-- start logo -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" valign=\"top\" style=\"padding: 36px 24px;\">\n"
                    + "              <a href=\"http://localhost:9999/SWP391-Project-Zara/home\" target=\"_blank\" style=\"display: inline-block;\">\n"
                    + "                <img src=\"images/home/logo.png\" alt=\"Logo\" border=\"0\" width=\"48\" style=\"display: block; width: 48px; max-width: 48px; min-width: 48px;\">\n"
                    + "              </a>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end logo -->\n"
                    + "\n"
                    + "    <!-- start hero -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "          <tr>\n"
                    + "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 36px 24px 0; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;\">\n"
                    + "              <h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px;\">Cảm ơn bạn đã mua hàng của chúng tôi!</h1>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end hero -->\n"
                    + "\n"
                    + "    <!-- start copy block -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "\n"
                    + "          <!-- start copy -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "              <p style=\"margin: 0;\">Đây là chi tiết đơn hàng của bạn. Nếu bạn có thắc mắc liên hê chê tôi ở đây <a href=\"http://localhost:8080/mobileshop/Home\">contact us</a>.</p>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end copy -->\n"
                    + "\n"
                    + "          <!-- start receipt table -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
                    + "                <tr>\n"
                    + "                  <td align=\"left\" bgcolor=\"#fe0f9e\" width=\"75%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Mã đơn hàng #</strong></td>\n"
                    + "                  <td align=\"left\" bgcolor=\"#fe0f9e\" width=\"25%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>" + order.getId() + "</strong></td>\n"
                    + "                </tr>\n"
                    + "                <tr>\n"
                    + "                  <td align=\"left\"  width=\"75%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Tên sản phẩm</strong></td>\n"
                    + "                  <td align=\"left\"  width=\"25%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Số lượng</strong></td>\n"
                    + "                </tr>\n"
                    + "                <tr>\n"
                    + "                  <td align=\"left\" width=\"75%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">Sales Tax</td>\n"
                    + "                  <td align=\"left\" width=\"25%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">$0.00</td>\n"
                    + "                </tr>\n"
                    + "                <tr>\n"
                    + "                  <td align=\"left\" width=\"75%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #D2C7BA; border-bottom: 2px dashed #D2C7BA;\"><strong>Tổng giá</strong></td>\n"
                    + "                  <td align=\"left\" width=\"25%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #D2C7BA; border-bottom: 2px dashed #D2C7BA;\"><strong>" + total + "$" + "</strong></td>\n"
                    + "                </tr>\n"
                    + "              </table>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end reeipt table -->\n"
                    + "\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end copy block -->\n"
                    + "\n"
                    + "    <!-- start receipt address block -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\" valign=\"top\" width=\"100%\">\n"
                    + "        \n"
                    + "        <table align=\"center\" bgcolor=\"#ffffff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" valign=\"top\" style=\"font-size: 0; border-bottom: 3px solid #d4dadf\">\n"
                    + "              \n"
                    + "              <div style=\"display: inline-block; width: 100%; max-width: 50%; min-width: 240px; vertical-align: top;\">\n"
                    + "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 300px;\">\n"
                    + "                  <tr>\n"
                    + "                    <td align=\"left\" valign=\"top\" style=\"padding-bottom: 36px; padding-left: 36px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "                      <p><strong>Địa chỉ nhận hàng <!-- Chỉnh dữ liêu ở đây --></strong></p>\n"
                    + "                      <p>" + order.getCustomerAddress() + "</p>\n"
                    + "                    </td>\n"
                    + "                  </tr>\n"
                    + "                </table>\n"
                    + "              </div>\n"
                    + "              \n"
                    + "              <div style=\"display: inline-block; width: 100%; max-width: 50%; min-width: 240px; vertical-align: top;\">\n"
                    + "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 300px;\">\n"
                    + "                  <tr>\n"
                    + "                    <td align=\"left\" valign=\"top\" style=\"padding-bottom: 36px; padding-left: 36px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "                      <p><strong>Ngày đặt hàng <!-- Chỉnh dữ liêu ở đây --></strong></p>\n"
                    + "                      <p>" + order.getDate() + "</p>\n"
                    + "                    </td>\n"
                    + "                  </tr>\n"
                    + "                </table>\n"
                    + "              </div>\n"
                    + "              \n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "        </table>\n"
                    + "        \n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end receipt address block -->\n"
                    + "\n"
                    + "    <!-- start footer -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 24px;\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "\n"
                    + "          <!-- start permission -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 12px 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; color: #666;\">\n"
                    + "              <p style=\"margin: 0;\">You received this email because we received a request for [type_of_action] for your account. If you didn't request [type_of_action] you can safely delete this email.</p>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end permission -->\n"
                    + "\n"
                    + "          <!-- start unsubscribe -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 12px 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; color: #666;\">\n"
                    + "              <p style=\"margin: 0;\">To stop receiving these emails, you can <a href=\"https://sendgrid.com\" target=\"_blank\">unsubscribe</a> at any time.</p>\n"
                    + "              <p style=\"margin: 0;\">Paste 1234 S. Broadway St. City, State 12345</p>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end unsubscribe -->\n"
                    + "\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end footer -->\n"
                    + "\n"
                    + "  </table>\n"
                    + "  <!-- end body -->\n"
                    + "\n"
                    + "</body>\n"
                    + "</html>";

            email e = new email();

            try {
                e.send(email, "Place Order", content);
            } catch (MessagingException ex) {
                Logger.getLogger(MethodPayment.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.getRequestDispatcher("Views/Thank.jsp").forward(request, response);
        } else {
            request.setAttribute("total", total);
            request.getRequestDispatcher("paymentcontroller").forward(request, response);
        }

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
