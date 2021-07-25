package es.caib.prova;


public class Convocatoria{
	    /* ESTRUCTURA JSON CONVOCATORIES
	   	 *  {
	   	 *  "convocatoria": [
	   	 *  			{
	   	 *  				"dataPublicacio": "27/04/2021",
	   	 *  				"dataComençament": "27/04/2021",
	   	 *  				"dataFinalitzacio": "29/04/2021",
	   	 *  			}
	   	 *  		]
	   	 *  }
	     * */
		   private int id;
		   private String titolConvocatoria;
		   private String dataPublicacio;
		   private String dataComençament;
		   private String dataFinalitzacio;
		   
		   

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getTitolConvocatoria() {
			return titolConvocatoria;
		}

		public void setTitolConvocatoria(String titolConvocatoria) {
			this.titolConvocatoria = titolConvocatoria;
		}

		public String getDataPublicacio() {
			return dataPublicacio;
		}

		public void setDataPublicacio(String dataPublicacio) {
			this.dataPublicacio = dataPublicacio;
		}

		public String getDataComençament() {
			return dataComençament;
		}

		public void setDataComençament(String dataComençament) {
			this.dataComençament = dataComençament;
		}

		public String getDataFinalitzacio() {
			return dataFinalitzacio;
		}

		public void setDataFinalitzacio(String dataFinalitzacio) {
			this.dataFinalitzacio = dataFinalitzacio;
		}

		public Convocatoria() {
		}
		
		public static Convocatoria crearConvocatoria(String titolConvocatoria,String dataPublicacio, String dataComençament, String dataFinalitzacio) {
			Convocatoria convocatoria = new Convocatoria();
			convocatoria.id += 1;
			convocatoria.titolConvocatoria = titolConvocatoria;
			convocatoria.dataPublicacio = dataPublicacio;
			convocatoria.dataComençament = dataComençament;
			convocatoria.dataFinalitzacio = dataFinalitzacio;
			return convocatoria;
		}
		
		@Override
		public String toString() {
			return "Convocatories [id=" + id + ", dataPublicada=" + dataPublicacio + ", dataInici=" + dataComençament
					+ ", dataFi=" + dataFinalitzacio + "]";
		}
		
		
		
		
		  
}
