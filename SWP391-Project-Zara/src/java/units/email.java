/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package units;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ManhPhuc
 */
public class email {

    private final String password = "svrg kskl oqsl isph";

    public static void main(String[] args) {
        
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
                + "                  <td align=\"left\" bgcolor=\"#fe0f9e\" width=\"25%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong></strong></td>\n"
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
                + "                  <td align=\"left\" width=\"25%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #D2C7BA; border-bottom: 2px dashed #D2C7BA;\"><strong></strong></td>\n"
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
                + "                      <p>" +"</p>\n"
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
                + "                      <p></p>\n"
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

        try {
            send("khongmanhphuc2003@gmail.com", "Test mail", "fgesrgfre");
            System.out.println("da gui");
        } catch (Exception e) {
            System.out.println("loi");
        }
    }

    public static void send(String to, String sub,
            String msg) throws AddressException,
            MessagingException {
        final String user = "khongmanhphuc2003@gmail.com";
        final String pass = "qecy mbsn zdra sotu";
        Properties props = new Properties();

        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));
        InternetAddress[] toAddresses = {new InternetAddress(to)};
        message.setRecipients(Message.RecipientType.TO, toAddresses);
        message.setSubject(sub);
        message.setSentDate(new java.util.Date());
        message.setText(msg);
        message.addHeader("Content-type", "text/HTML; charset=UTF-8");
        message.setContent(msg, "text/HTML; charset=UTF-8");
        Transport.send(message);
    }

    public static void send1(String to, String sub, String msg) throws AddressException, MessagingException {
        String user = "sunqhe171358@fpt.edu.vn";
        String pass = "svrg kskl oqsl isph";
        Properties props = new Properties();

        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "false");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, null);

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));
        InternetAddress[] toAddresses = {new InternetAddress(to)};
        System.out.println(toAddresses.toString());
        message.setRecipients(Message.RecipientType.TO, toAddresses);
        message.setSubject(sub);
        message.setSentDate(new java.util.Date());
        message.setText(msg);
        // Transport.send(message);
    }
}
