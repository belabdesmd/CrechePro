package com.crechepro.utils;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.util.Date;

public class PDFUtils {

    private static String FILE = "C:/Users/Abdessamed/Desktop/First-2.pdf";

    private static Font titleFont = new Font(Font.FontFamily.UNDEFINED, 18,
            Font.UNDERLINE | Font.BOLD);

    private static Font smallNormal = new Font(Font.FontFamily.UNDEFINED, 12,
            Font.NORMAL);
    private static Font smallBold = new Font(Font.FontFamily.UNDEFINED, 12,
            Font.BOLD);

    public static void createDocument() {
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            document.open();
            addMetaData(document);
            addContent(document);
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void addMetaData(Document document) {
        document.addTitle("Contract");
        document.addAuthor("Creche Pro");
        document.addCreator("Creche Pro");
    }

    private static void addContent(Document document)
            throws DocumentException {

        Paragraph preface = new Paragraph();

        addEmptyLine(preface, 1);

        Paragraph title = new Paragraph("Creche Contract", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);

        addEmptyLine(preface, 2);

        preface.add(new Paragraph("Full Name:", smallBold));

        preface.add(new Paragraph("Belfodil A", smallNormal));

        preface.add(new Paragraph("Gender:", smallBold));

        preface.add(new Paragraph("Male", smallNormal));

        preface.add(new Paragraph("Age:", smallBold));

        preface.add(new Paragraph("5 Years", smallNormal));

        preface.add(new Paragraph("Parent's/Gardien's Full Name:", smallBold));

        preface.add(new Paragraph("Belfodil Abdessamed", smallNormal));

        preface.add(new Paragraph("Address:", smallBold));

        preface.add(new Paragraph("494 Logts", smallNormal));

        preface.add(new Paragraph("Email:", smallBold));

        preface.add(new Paragraph("a.belfodil@esi-sba.dz", smallNormal));

        preface.add(new Paragraph("Phone Number:", smallBold));

        preface.add(new Paragraph("0663231326", smallNormal));

        addEmptyLine(preface, 2);

        preface.add(new Paragraph("Term Of Agreement:", titleFont));

        addEmptyLine(preface, 1);

        preface.add(new Paragraph("Commencement Date:", smallBold));

        preface.add(new Paragraph("19/08/2019", smallNormal));

        preface.add(new Paragraph("Ending Date:", smallBold));

        preface.add(new Paragraph("19/08/2020", smallNormal));

        addEmptyLine(preface, 2);

        preface.add(new Paragraph("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor" +
                "incididunt ut labore et dolore magna aliqua. Nunc scelerisque viverra mauris in aliquam sem. Id aliquet" +
                " lectus proin nibh nisl condimentum. Enim tortor at auctor urna. Est velit egestas dui id ornare. Dictum " +
                "non consectetur a erat nam. Faucibus a pellentesque sit amet porttitor eget dolor." +
                "Ornare massa eget egestas purus viverra. Etiam dignissim diam quis enim. Et molestie ac feugiat sed lectus " +
                "vestibulum. Eros in cursus turpis massa. Amet mauris commodo quis imperdiet.", smallNormal));

        addEmptyLine(preface, 6);

        Paragraph director_signature = new Paragraph("                              Director Signature", smallNormal);
        director_signature.setAlignment(Element.ALIGN_LEFT);

        Paragraph parent_signature = new Paragraph("Parent signature                                ", smallNormal);
        parent_signature.setAlignment(Element.ALIGN_RIGHT);

        document.add(preface);

        document.add(director_signature);
        document.add(parent_signature);
    }

    private static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
}
