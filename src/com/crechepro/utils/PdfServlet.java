package com.crechepro.utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet("/contract.pdf")
public class PdfServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (PDFUtils.getPdfPath() != null){
            File file = new File(PDFUtils.getPdfPath());
            response.setHeader("Content-Type", getServletContext().getMimeType(file.getName()));
            response.setHeader("Content-Length", String.valueOf(file.length()));
            response.setHeader("Content-Disposition", "inline; filename=\"contract.pdf\"");
            Files.copy(file.toPath(), response.getOutputStream());
        }
    }
}
