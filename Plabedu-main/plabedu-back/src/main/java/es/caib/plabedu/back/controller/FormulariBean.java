package es.caib.plabedu.back.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.component.UIComponent;
import javax.faces.component.UIInput;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;

import es.caib.plabedu.back.model.Formulari;
import es.caib.plabedu.back.model.Plaza;

@ManagedBean
@RequestScoped
/**
 * Controla la lògica del formulari.xhtml.
 * 
 * @author e41621391q
 *
 */
public class FormulariBean {

	private Formulari formulari = new Formulari();
	private static List<Formulari> lista = new ArrayList<>();
	private static List<Plaza> listaPlazas = new ArrayList<>();
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
		FormulariBean.lista = lista;
	}

	public List<Plaza> getListaPlazas() {
		return listaPlazas;
	}

	public void setListaPlazas(List<Plaza> listaPlazas) {
		FormulariBean.listaPlazas = listaPlazas;
	}

	public Integer[] getNumPlaza() {
		return numPlaza;
	}

	public void setNumPlaza(Integer[] numPlaza) {
		FormulariBean.numPlaza = numPlaza;
	}

	/**
	 * Afegeix un objecte Formulari al dataTable.
	 */
	public void registrar() {
		FormulariBean.lista.add(this.formulari);

	}

	/**
	 * Omple la listaPlazas amb objectes Plaza per visualitzar-los al dataTable.
	 * Inicilitza l'array numPlaza i l'omple amb el nombre de places que s'han
	 * afegit.
	 */
	public void afegirPlaza() {
		FormulariBean.listaPlazas.add(new Plaza("IES JUNIPER SERRA (Palma)", 0));
		FormulariBean.listaPlazas.add(new Plaza("IES MOSSEN ALCOVER (Manacor)", 0));
		FormulariBean.listaPlazas.add(new Plaza("IES SON FERRER (Calvià)", 0));
		FormulariBean.listaPlazas.add(new Plaza("IES SANTA MARGALIDA (Santa Margalida)", 0));
		FormulariBean.listaPlazas.add(new Plaza("IES CAPDEPERA (Capdepera)", 0));
		FormulariBean.listaPlazas.add(new Plaza("IES CALVIA (Calvia)", 0));
		FormulariBean.listaPlazas.add(new Plaza("IES SANTA MARGALIDA (Santa Margalida)", 0));
		FormulariBean.numPlaza = new Integer[FormulariBean.listaPlazas.size() + 1];
		for (int i = 0; i < FormulariBean.listaPlazas.size() + 1; i++) {
			FormulariBean.numPlaza[i] = i;
		}
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
	 * Modifica l'ordre de preferència d'una plaça concreta.
	 */
	public void modificaOrdre(AjaxBehaviorEvent event) {
		Integer numero = (Integer) event.getComponent().getAttributes().get("numero");
		Plaza plaza = (Plaza) event.getComponent().getAttributes().get("plaza");
		plaza.setOrdrePreferencia(numero);
	}
}
