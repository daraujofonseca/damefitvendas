<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mostra Fornecedor</title>
</head>
<body>
	<h3>Alterar Fornecedor - ${fornecedor.id}</h3>

	<form action="alteraFornecedor" method="post">

		<table>


			<tr>
				<td>Nome:</td>
				<td><input name="nome" type="text" id="nome"
					value="${fornecedor.nome}"></td>
			</tr>
			<tr>
				<td>CNPJ/CPF:</td>
				<td><input name="cnpjCpf" type="text" id="cnpjCpf"
					value="${fornecedor.cnpjCpf}"></td>
			</tr>

			<tr>
				<td>CEP:</td>
				<td><input name="cep" type="text" id="cep"
					value="${fornecedor.cep}" /></td>
			</tr>

			<tr>
				<td>Endereço:</td>
				<td><input name="endereco" type="text" id="endereco"
					value="${fornecedor.endereco}" /></td>
			</tr>

			<tr>
				<td>Bairro:</td>
				<td><input name="bairro" type="text" id="bairro"
					value="${fornecedor.bairro}" /></td>
			</tr>
			<tr>
				<td>Cidade:</td>
				<td><input name="cidade" type="text" id="cidade"
					value="${fornecedor.cidade}" /></td>
			</tr>
			<tr>
				<td>Estado:</td>
				<td><select name="uf" id="uf">
						<option>${fornecedor.uf}</option>
						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AP">AP</option>
						<option value="AM">AM</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="ES">ES</option>
						<option value="DF">DF</option>
						<option value="MA">MA</option>
						<option value="MT">MT</option>
						<option value="MS">MS</option>
						<option value="MG">MG</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PR">PR</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RS">RS</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="SC">SC</option>
						<option value="SP">SP</option>
						<option value="SE">SE</option>
						<option value="TO">TO</option>
				</select></td>
			</tr>

			<tr>
				<td>Telefone:</td>
				<td><input name="telefone" type="text" id="telefone"
					value="${fornecedor.telefone}"></td>
			</tr>

			<tr>
				<td>Fax:</td>
				<td><input name="fax" type="text" id="fax"
					value="${fornecedor.fax}"></td>
			</tr>

			<tr>
				<td>Celular:</td>
				<td><input name="celular" type="text" id="celular"
					value="${fornecedor.celular}"></td>
			</tr>

			<tr>
				<td>Email:</td>
				<td><input name="email" type="text" id="email"
					value="${fornecedor.email}"></td>
			</tr>

			<tr>
				<td><input type="hidden" name="id" id="id"
					value="${fornecedor.id}" /></td>
			</tr>



		</table>





		<input type="submit" value="Alterar" />




	</form>

</body>
</html>