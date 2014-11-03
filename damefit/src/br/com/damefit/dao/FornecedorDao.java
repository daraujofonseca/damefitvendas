package br.com.damefit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.damefit.jdbc.ConnectionFactory;
import br.com.damefit.modelo.Fornecedor;

public class FornecedorDao {

	Connection connection;

	public FornecedorDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adiciona(Fornecedor fornecedor) {

		String sql = "insert into fornecedor (nome,endereco,bairro,cidade,uf,cep,telefone,fax,celular,email,cnpjcpf,datacadastro)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1,
					fornecedor.getNome().trim().replaceAll("\\s+", " "));
			stmt.setString(2, fornecedor.getEndereco());
			stmt.setString(3, fornecedor.getBairro());
			stmt.setString(4, fornecedor.getCidade());
			stmt.setString(5, fornecedor.getUf());
			stmt.setString(6, fornecedor.getCep());
			stmt.setString(7, fornecedor.getTelefone());
			stmt.setString(8, fornecedor.getFax());
			stmt.setString(9, fornecedor.getCelular());
			stmt.setString(10, fornecedor.getEmail());
			stmt.setString(11, fornecedor.getCnpjCpf());

			stmt.setDate(12, new java.sql.Date(Calendar.getInstance()
					.getTimeInMillis()));

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				this.connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public List<Fornecedor> lista() {
		try {
			List<Fornecedor> fornecedores = new ArrayList<Fornecedor>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from fornecedor");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Fornecedor fornecedor = new Fornecedor();

				fornecedor.setId(rs.getLong("id"));
				fornecedor.setNome(rs.getString("nome"));
				fornecedor.setEndereco(rs.getString("endereco"));
				fornecedor.setBairro(rs.getString("bairro"));
				fornecedor.setCidade(rs.getString("cidade"));
				fornecedor.setCep(rs.getString("cep"));
				fornecedor.setUf(rs.getString("uf"));
				fornecedor.setTelefone(rs.getString("telefone"));
				fornecedor.setFax(rs.getString("fax"));
				fornecedor.setCelular(rs.getString("celular"));
				fornecedor.setEmail(rs.getString("email"));
				fornecedor.setCnpjCpf(rs.getString("cnpjcpf"));

				// adicionar objeto a lista

				fornecedores.add(fornecedor);
			}
			rs.close();
			stmt.close();
			System.out.println("Lista gerada com Sucesso!");
			return fornecedores;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				this.connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void remove(Fornecedor fornecedor) {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("delete from fornecedor where id = ?");

			stmt.setLong(1, fornecedor.getId());
			stmt.execute();
			stmt.close();

			System.out.println("Fornecedor Excluido com SUCESSO!");

		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				this.connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public boolean buscaDuplicados(Fornecedor fornecedor) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select *from fornecedor");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				if (fornecedor.getNome().trim().replaceAll("\\s+", " ")
						.toLowerCase()
						.equals(rs.getString("nome").toLowerCase())) {
					return true;

				}

			}

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}

		return false;

	}

	public Fornecedor buscaPorId(Long id) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from fornecedor");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				if (id == rs.getLong("id")) {
					// criando objeto fornecedor

					Fornecedor fornecedor = new Fornecedor();
					fornecedor.setId(rs.getLong("id"));
					fornecedor.setNome(rs.getString("nome"));
					fornecedor.setCnpjCpf(rs.getString("cnpjcpf"));
					fornecedor.setEndereco(rs.getString("endereco"));
					fornecedor.setBairro(rs.getString("bairro"));
					fornecedor.setCep(rs.getString("cep"));
					fornecedor.setCidade(rs.getString("cidade"));
					fornecedor.setUf(rs.getString("uf"));
					fornecedor.setTelefone(rs.getString("telefone"));
					fornecedor.setFax(rs.getString("fax"));
					fornecedor.setCelular(rs.getString("celular"));
					fornecedor.setEmail(rs.getString("email"));

					// System.out.println("retornado fornecedor:"+
					// fornecedor.getId());
					return fornecedor;
				}
			}
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void altera(Fornecedor fornecedor) {
		String sql = "update fornecedor set nome=?, cnpjcpf=?, cep=?, endereco=?, bairro=?, cidade=?, uf=?, telefone=?, fax=?, celular=?, email=? where id=?";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);

			stmt.setString(1, fornecedor.getNome());
			stmt.setString(2, fornecedor.getCnpjCpf());
			stmt.setString(3, fornecedor.getCep());
			stmt.setString(4, fornecedor.getEndereco());
			stmt.setString(5, fornecedor.getBairro());
			stmt.setString(6, fornecedor.getCidade());
			stmt.setString(7, fornecedor.getUf());
			stmt.setString(8, fornecedor.getTelefone());
			stmt.setString(9, fornecedor.getFax());
			stmt.setString(10, fornecedor.getCelular());
			stmt.setString(11, fornecedor.getEmail());
			stmt.setLong(12, fornecedor.getId());

			stmt.execute();
			stmt.close();

			System.out.println("DADOS ALTERADOS COM SUCESSO!");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				this.connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
