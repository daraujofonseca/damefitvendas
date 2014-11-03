package br.com.damefit.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionFactory {

	Connection con = null;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.out.println("Classe inválida");
			e.printStackTrace();
		}
	}

	public Connection getConnection() {

		try {
			String url = "jdbc:mysql://localhost:3306/damefit";
			String user = "root";
			String pass = "456365";
			if (con == null) {
				con = DriverManager.getConnection(url, user, pass);
			}
		} catch (Exception e) {
			System.out.println("Não foi possivel realizar a conexão");
			e.printStackTrace();
		}
		return con;

	}

}
