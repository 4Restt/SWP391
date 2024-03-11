/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;

@MultipartConfig
public class UploadImgAjax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("imgAfterUp", null);
        request.getRequestDispatcher("Views/AddStaff.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("image");

        String imageFileName = filePart.getSubmittedFileName();
        if(imageFileName.isEmpty()){
            
            imageFileName = request.getParameter("imageBackUp");
            imageFileName = imageFileName.substring("images/".length());
        }
        
        String uploadPath = "E:/Course/Spring2024/SWP391/GIT/SWP391_Group1_ZaraFashionProject/"
                + "SWP391-Project-Zara-Manager/web/images/" + imageFileName;
        String dbUploadPath = "images/" + imageFileName;
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = filePart.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(dbUploadPath);
//                response.getWriter().write("File " + imageFileName + " has been uploaded successfully.");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
