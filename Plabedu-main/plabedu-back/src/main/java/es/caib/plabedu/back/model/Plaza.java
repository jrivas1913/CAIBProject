package es.caib.plabedu.back.model;

public class Plaza {

	private String unitatDestinacio;
	private Integer ordrePreferencia;

	public String getUnitatDestinacio() {
		return unitatDestinacio;
	}

	public void setUnitatDestinacio(String unitatDestinacio) {
		this.unitatDestinacio = unitatDestinacio;
	}

	public Integer getOrdrePreferencia() {
		return ordrePreferencia;
	}

	public void setOrdrePreferencia(Integer ordrePreferencia) {
		this.ordrePreferencia = ordrePreferencia;
	}

	public Plaza(String unitatDestinacio, Integer ordrePreferencia) {
		super();
		this.unitatDestinacio = unitatDestinacio;
		this.ordrePreferencia = ordrePreferencia;
	}

	public Plaza() {
		super();
	}

}
