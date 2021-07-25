package es.caib.plabedu.back.model;

public class Formulari {

	private String nom;
	private String llinatge;
	private Integer telefon;
	private String email;

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getLlinatge() {
		return llinatge;
	}

	public void setLlinatge(String llinatge) {
		this.llinatge = llinatge;
	}

	public Integer getTelefon() {
		return telefon;
	}

	public void setTelefon(Integer telefon) {
		this.telefon = telefon;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Formulari() {
		super();
	}
}
