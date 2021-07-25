package es.caib.plabedu.back.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.component.UIInput;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;

import es.caib.plabedu.back.model.Formulari;
import es.caib.plabedu.back.model.Plaza;

@Named
@RequestScoped
public class FormulariBeanPrime implements Serializable {

	private static final long serialVersionUID = 1L;
	private Formulari formulari = new Formulari();
	private static List<Formulari> lista = new ArrayList<>();
	private static List<Plaza> listaPlazas;
	private static Integer[] numPlaza;

	public Formulari getFormulari() {
		return formulari;
	}

	public void setFormulari(Formulari formulari) {
		this.formulari = formulari;
	}

	public List<Formulari> getLista() {
		return lista;
	}

	public void setLista(List<Formulari> lista) {
		FormulariBeanPrime.lista = lista;
	}

	public List<Plaza> getListaPlazas() {
		return listaPlazas;
	}

	public void setListaPlazas(List<Plaza> listaPlazas) {
		FormulariBeanPrime.listaPlazas = listaPlazas;
	}

	public Integer[] getNumPlaza() {
		return numPlaza;
	}

	public void setNumPlaza(Integer[] numPlaza) {
		FormulariBeanPrime.numPlaza = numPlaza;
	}
	
	//---------------------------PUBLIC METHODS------------------------------------------------
	
	/**
	 * Omple la listaPlazas amb objectes Plaza per visualitzar-los al dataTable.
	 * Inicilitza l'array numPlaza i l'omple amb el nombre de places que s'han
	 * afegit.
	 */
	@PostConstruct
	public void afegirPlaza() {
		FormulariBeanPrime.listaPlazas = new ArrayList<Plaza>();
		FormulariBeanPrime.listaPlazas.add(new Plaza("IES JUNIPER SERRA (Palma)", 0));
		FormulariBeanPrime.listaPlazas.add(new Plaza("IES MOSSEN ALCOVER (Manacor)", 0));
		FormulariBeanPrime.listaPlazas.add(new Plaza("IES SON FERRER (Calvià)", 0));
		FormulariBeanPrime.listaPlazas.add(new Plaza("IES SANTA MARGALIDA (Santa Margalida)", 0));
		FormulariBeanPrime.listaPlazas.add(new Plaza("IES CAPDEPERA (Capdepera)", 0));
		FormulariBeanPrime.listaPlazas.add(new Plaza("IES CALVIA (Calvia)", 0));
		FormulariBeanPrime.listaPlazas.add(new Plaza("IES SANTA MARGALIDA (Santa Margalida)", 0));
		FormulariBeanPrime.numPlaza = new Integer[FormulariBeanPrime.listaPlazas.size() + 1];
		for (int i = 0; i < FormulariBeanPrime.listaPlazas.size() + 1; i++) {
			FormulariBeanPrime.numPlaza[i] = i;
		}
	}
	
	/**
	 * Afegeix un objecte Formulari al dataTable.
	 */
	public void registrar() {
		FormulariBeanPrime.lista.add(this.formulari);
	}
	
	/**
	 * Edita la part del PDF després d'afegir el datatable.
	 * 
	 * @param document
	 * @throws IOException
	 * @throws BadElementException
	 * @throws DocumentException
	 */
	public void postProcessPDF(Object document) throws IOException, BadElementException, DocumentException {
		Document pdf = (Document) document;
		Paragraph p = new Paragraph("\n\n" + this.getCurrentFormatDate() + this.getCurrentIPAddress());
		pdf.add(p);
	}

	/**
	 * Edita la part del PDF abans d'afegir el datatable.
	 * 
	 * @param document
	 * @throws IOException
	 * @throws BadElementException
	 * @throws DocumentException
	 */
	public void preProcessPDF(Object document) throws IOException, BadElementException, DocumentException {
		Document pdf = (Document) document;
		pdf.open();
		pdf.setPageSize(PageSize.A4);
		Paragraph p = new Paragraph("Nom: " + this.formulari.getNom() + "\n" + "Llinatges: "
				+ this.formulari.getLlinatge() + "\n" + "Telèfon: " + this.formulari.getTelefon() + "\n"
				+ "Correu electrònic: " + this.formulari.getEmail() + "\n\n");
		pdf.add(p);
	}

	/**
	 * Valida el inputText "email". Si el String compleix la condició amollarà un
	 * error de validació.
	 * 
	 * @param context    Podem tenir accés a totes les variables.
	 * @param toValidate El component que invoca aquest mètode.
	 * @param value      El valor que dutrae consigo el componente
	 */
	public void validar(FacesContext context, UIComponent toValidate, Object value) {
		context = FacesContext.getCurrentInstance();
		String email = (String) value;
		if (!email.contains("@")) {
			((UIInput) toValidate).setValid(false);
			context.addMessage(toValidate.getClientId(context), new FacesMessage("Email no válido"));
		}
	}

	/**
	 * Evita que l'usuari seleccioni el mateix ordre de preferència per dues o més
	 * places.
	 */
	public void validarOrdrePreferencia() {
		for (Plaza plaza : FormulariBeanPrime.listaPlazas) {
			if (plaza.getOrdrePreferencia() != 0) {
				for (Plaza plaza2 : FormulariBeanPrime.listaPlazas) {
					if (plaza != plaza2 && plaza.getOrdrePreferencia() == plaza2.getOrdrePreferencia()) {
						plaza.setOrdrePreferencia(0);
					}
				}
			}
		}
	}
	
	//---------------------------PRIVATE METHODS------------------------------------------------

	/**
	 * Captura la data actual.
	 * 
	 * @return String de la data amb format (dia/mes/any hora:minuts:segons)
	 */
	private String getCurrentFormatDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		return formatter.format(date);
	}

	/**
	 * Captura la direcció IPv4 del dispositiu que s'està utilitzant.
	 * 
	 * @return String amb la ip.
	 * @throws UnknownHostException
	 */
	private String getCurrentIPAddress() throws UnknownHostException {
		return Inet4Address.getLocalHost().getHostAddress();
	}
}
