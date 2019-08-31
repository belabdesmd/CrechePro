=
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.File" %>
<%@ page import="com.crechepro.bean.Employee" %>
<%@ page import="com.crechepro.dao.EmployeeDAO" %>
<%@ page import="com.crechepro.utils.DBHelper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    File file;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    String filePath = "A:/Abdessamed/STUDY/mini PROJECT/CrechePro/web/images/";

    // Verify the content type
    String contentType = request.getContentType();

    if ((contentType.contains("multipart/form-data"))) {

        DiskFileItemFactory factory = new DiskFileItemFactory();

        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Employee employee = new Employee();

            for (Object fileItem : fileItems) {
                FileItem fi = (FileItem) fileItem;

                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fileName = employee.getFirst_name() + "_" + employee.getLast_name() + ".jpeg";
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();

                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath +
                                fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath +
                                fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                } else {
                    switch (fi.getFieldName()) {
                        case "first_name":
                            employee.setFirst_name(fi.getString());
                            break;
                        case "last_name":
                            employee.setLast_name(fi.getString());
                            break;
                        case "gender":
                            employee.setGender(fi.getString());
                            break;
                        case "birthday":
                            employee.setBirthday(fi.getString());
                            break;
                        case "email":
                            employee.setEmail(fi.getString());
                            break;
                        case "address":
                            employee.setAddress(fi.getString());
                            break;
                        case "phone":
                            try {
                                employee.setPhone(Integer.valueOf(fi.getString()));
                            } catch (NumberFormatException e) {
                                //Ignore
                            }
                            break;
                    }
                }
            }

            EmployeeDAO.createEmployee(DBHelper.getConnection(), employee);

            response.sendRedirect("employees.jsp");

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
%>
