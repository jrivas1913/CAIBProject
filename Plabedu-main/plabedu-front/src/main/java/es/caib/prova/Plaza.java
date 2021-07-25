package es.caib.prova;

public class Plaza {
	/*-----ESTRUCTURA JSON PERSONAL DE NETEJA-----
	 *  {
	 *  "plaza": [
	 *  			{
	 *  				"dataAdjudicacio": "09-04-2021",
	 *  				"tipusContracte": "Eventual",
	 *  				"tipusJornada": "Parcial",
	 *  				"dataInici": "10-04-2021",
	 *  				"dataFiPrevista": "01-05-2021",
	 *  				"motiu": "IT",
	 *  				"illa": "Mallorca",
	 *  				"municipi": "Palma",
	 *  				"nomOcupant": "Fuster Bauza, Albert",
	 *  				"unitat": "IES Ses Estacions",
	 *  			}
	 *  		]
	 *  }
	 */
	private static int autoIncrementId;
	private int id;
	private String dataAdjudicacio;
	private String tipusContracte;
	private String tipusJornada;
	private String dataInici;
	private String dataFiPrevista;
	private String motiu;
	private String illa;
	private String municipi;
	private String unitat;
	private String nomDelLloc;
	private boolean itinerant;
	private String nomOcupant;
	private String sexeOcupant;
	private String categoria;
	private final String admin = "caib";

	public String getUnitat() {
		return unitat;
	}

	public void setUnitat(String unitat) {
		this.unitat = unitat;
	}

	public String getDataAdjudicacio() {
		return dataAdjudicacio;
	}

	public void setDataAdjudicacio(String dataAdjudicacio) {
		this.dataAdjudicacio = dataAdjudicacio;
	}

	public String getNomDelLloc() {
		return nomDelLloc;
	}

	public void setNomDelLloc(String nomDelLloc) {
		this.nomDelLloc = nomDelLloc;
	}

	public String getTipusContracte() {
		return tipusContracte;
	}

	public void setTipusContracte(String tipusContracte) {
		this.tipusContracte = tipusContracte;
	}

	public String getTipusJornada() {
		return tipusJornada;
	}

	public void setTipusJornada(String tipusJornada) {
		this.tipusJornada = tipusJornada;
	}

	public boolean isItinerant() {
		return itinerant;
	}

	public void setItinerant(boolean itinerant) {
		this.itinerant = itinerant;
	}

	public String getDataInici() {
		return dataInici;
	}

	public void setDataInici(String dataInici) {
		this.dataInici = dataInici;
	}

	public String getDataFiPrevista() {
		return dataFiPrevista;
	}

	public void setDataFiPrevista(String dataFiPrevista) {
		this.dataFiPrevista = dataFiPrevista;
	}

	public String getMotiu() {
		return motiu;
	}

	public void setMotiu(String motiu) {
		this.motiu = motiu;
	}

	public String getIlla() {
		return illa;
	}

	public void setIlla(String illa) {
		this.illa = illa;
	}

	public String getMunicipi() {
		return municipi;
	}

	public void setMunicipi(String municipi) {
		this.municipi = municipi;
	}

	public String getNomOcupant() {
		return nomOcupant;
	}

	public void setNomOcupant(String nomOcupant) {
		this.nomOcupant = nomOcupant;
	}

	public String getSexeOcupant() {
		return sexeOcupant;
	}

	public void setSexeOcupant(String sexeOcupant) {
		this.sexeOcupant = sexeOcupant;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Plaza() {
	}

	public static Plaza createAdjudgedPlace(String dataAdjudicacio, String tipusContracte, String tipusJornada,
			String dataInici, String dataFiPrevista, String motiu, String illa, String municipi, String nomOcupant,
			String unitat) {
		autoIncrementId += 1;
		Plaza plaza = new Plaza();
		plaza.id = autoIncrementId;
		plaza.dataAdjudicacio = dataAdjudicacio;
		plaza.tipusContracte = tipusContracte;
		plaza.tipusJornada = tipusJornada;
		plaza.dataInici = dataInici;
		plaza.dataFiPrevista = dataFiPrevista;
		plaza.motiu = motiu;
		plaza.illa = illa;
		plaza.municipi = municipi;
		plaza.nomOcupant = nomOcupant;
		plaza.unitat = unitat;
		return plaza;
	}

	@Override
	public String toString() {
		return "PlaceModel [id=" + id + ", dataAdjudicacio=" + dataAdjudicacio + ", nomDelLloc=" + nomDelLloc
				+ ", unitat=" + unitat + ", tipusContracte=" + tipusContracte + ", tipusJornada=" + tipusJornada
				+ ", itinerant=" + itinerant + ", dataInici=" + dataInici + ", dataFiPrevista=" + dataFiPrevista
				+ ", motiu=" + motiu + ", illa=" + illa + ", municipi=" + municipi + ", nomOcupant=" + nomOcupant
				+ ", sexeOcupant=" + sexeOcupant + ", categoria=" + categoria + ", admin=" + admin + "]";
	}
}
