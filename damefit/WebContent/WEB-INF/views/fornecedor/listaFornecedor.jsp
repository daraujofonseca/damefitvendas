<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="../cabecalho.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#minhatabela').DataTable();
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Cadastro de Fornecedores</title>

</head>

<body>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h2 class="page-header">Cadastro de Fornecedores</h2>

		<div class="sub-header" align="right">
			<a href="novoFornecedor" class="btn btn-primary btn-lg">Novo</a>
		</div>
		<p style="line-height: 16px"></p>

		<div class="table-responsive">

			<table id="minhatabela" class="table table-striped table-bordered table-condensed">

				<thead>
					<tr>
						<th>Nome</th>
						<th>CNPJ/CPF</th>
						<th>Email</th>
						<th>Endereco</th>
						<th>Telefone</th>
						<th>Celular</th>
						<th></th>
						<th></th>
					</tr>
				</thead>

				<tfoot>
					<tr>
						<th>Nome</th>
						<th>CNPJ/CPF</th>
						<th>Email</th>
						<th>Endereco</th>
						<th>Telefone</th>
						<th>Celular</th>
						<th></th>
						<th></th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${fornecedores}" var="fornecedor">
						<tr>
							<td>${fornecedor.nome}</td>
							<td>${fornecedor.cnpjCpf}</td>
							<td>${fornecedor.email}</td>
							<td>${fornecedor.endereco}-${fornecedor.bairro}-
								${fornecedor.cidade} - ${fornecedor.uf}</td>
							<td>${fornecedor.telefone}</td>
							<td>${fornecedor.celular}</td>
							<td><a href="mostraFornecedor?id=${fornecedor.id}"><i
									class="fa fa-edit fa-2x"></i></a></td>
							<td><a href="removeFornecedor?id=${fornecedor.id}"><i
									class="fa fa-trash fa-2x"></i> </a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>