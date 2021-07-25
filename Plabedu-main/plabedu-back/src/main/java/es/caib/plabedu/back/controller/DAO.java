package es.caib.plabedu.back.controller;

import java.sql.Connection;

public class DAO {

	private Connection cn;

	public Connection getCn() {
		return cn;
	}

	public void setCn(Connection cn) {
		this.cn = cn;
	}
	
	public void Conectar() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//this.cn=Drivemanager.getConnection("jdbc:mysql://localhost:3306/bbddname?user=www_plabedu&password=www_plabedu");
		}catch(Exception e) {
			throw e;
		}
	}
	
	public void cerrar() throws Exception {
		try {
			if(cn!=null) {
				if(!cn.isClosed()) {
					cn.close();
				}
			}
		}catch(Exception e) {
			throw e;
		}
		
	}
}
