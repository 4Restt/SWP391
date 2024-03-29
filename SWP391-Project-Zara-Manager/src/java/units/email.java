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
        try {
            send("khongmanhphuc2003@gmail.com", "Test mail", "jhjasdajdsahjhj");
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
        Transport.send(message);
    }

    public static void addStaffSend(String to, String username, String password) throws AddressException, MessagingException {
        final String user = "khongmanhphuc2003@gmail.com";
        final String pass = "qecy mbsn zdra sotu";
        String subject = "New Account Information";
        String body = "Subject: New Account Information\n\n" +
                      "Dear User,\n\n" +
                      "Welcome to our platform! Your account details are as follows:\n\n" +
                      "Username: " + username + "\n" +
                      "Password: " + password + "\n\n" +
                      "Please remember to keep your login information safe and do not share it with anyone.\n\n" +
                      "If you have any questions or encounter any issues, feel free to contact our support team.\n\n" +
                      "Best regards,\n" +
                      "[Kiara]";
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
        message.setSubject(subject);
        message.setSentDate(new java.util.Date());
        message.setText(body);
        Transport.send(message);
    }
}
