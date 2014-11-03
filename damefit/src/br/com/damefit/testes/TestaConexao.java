package br.com.damefit.testes;

import br.com.damefit.jdbc.ConnectionFactory;

public class TestaConexao {

	public static void main(String[] args) {
		
		ConnectionFactory conecta = new ConnectionFactory();
		
		conecta.getConnection();

	}

}
