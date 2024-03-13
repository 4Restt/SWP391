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
            send("khongmanhphuc2003@gmail.com", "Test mail", "gui tu SWP");
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
