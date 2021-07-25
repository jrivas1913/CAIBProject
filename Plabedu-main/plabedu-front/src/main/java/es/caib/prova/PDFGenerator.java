package es.caib.prova;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

public class PDFGenerator {

	public static void createPDF(String nom, String llinatge) {
		try {
			PdfDocument pdf = new PdfDocument(new PdfWriter("C:\\Users\\e41621391q\\provas2.pdf"));
			Document document = new Document(pdf);
			String line = "Nom: " + nom;
			document.add(new Paragraph(line));
			line = "Llinatge: " + llinatge;
			document.add(new Paragraph(line));
			document.close();
		} catch (Exception e) {
			System.out.println("Error");
		}
	}
}
