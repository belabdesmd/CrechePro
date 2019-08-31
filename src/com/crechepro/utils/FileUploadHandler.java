package com.crechepro.utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class FileUploadHandler extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "A:/Abdessamed/STUDY/mini PROJECT/CrechePro/web/images/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //process only if its multipart content
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
//                        Employee employee = new Employee();
//
//                        switch (item.getFieldName()) {
//                            case "first_name":
//                                employee.setFirst_name(item.getName());
//                                break;
//                            case "last_name":
//                                employee.setLast_name(item.getName());
//                                break;
//                            case "gender":
//                                employee.setGender(item.getName());
//                                break;
//                            case "birthday":
//                                employee.setBirthday(item.getName());
//                                break;
//                            case "email":
//                                employee.setEmail(item.getName());
//                                break;
//                            case "address":
//                                employee.setAddress(item.getName());
//                                break;
//                            case "phone":
//                                System.out.println(item.getName());
//                                break;
//                            case "file":
//                                break;
//                        }
                        String name = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }

                //File uploaded successfully
                request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }

        } else {
            request.setAttribute("message",
                    "Sorry this Servlet only handles file upload request");
        }

        request.getRequestDispatcher("/employees.jsp").forward(request, response);
    }
}
