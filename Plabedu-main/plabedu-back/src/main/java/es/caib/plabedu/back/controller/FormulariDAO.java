package es.caib.plabedu.back.controller;

import java.sql.PreparedStatement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import es.caib.plabedu.back.model.Formulari;

public class FormulariDAO extends DAO {
	private static final Logger log = LoggerFactory.getLogger(FormulariDAO.class);

	public void registrar(Formulari formulari) throws Exception {
		try {
			//this.Conectar();
			//PreparedStatement st = this.getCn().prepareStatement("SQL code");
			//st.setString(1, null);
			//st.executeUpdate();
			log.info(formulari.toString());
		}catch(Exception e) {
			throw e;
		}finally {
			this.cerrar();
		}
	}
}
