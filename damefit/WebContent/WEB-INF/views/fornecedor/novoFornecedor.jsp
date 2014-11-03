<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Cadastro de Fornecedor</title>
<c:import url="../cabecalho.jsp" />
</head>

<body>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h2 class="page-header">Cadastro de Fornecedores</h2>

		<div class="row">
			<div class="col-md-12 col-sm-6 col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<i class="icon-calendar"></i>
						<h3 class="panel-title">Formulário para Inclusão de
							Fornecedores</h3>
					</div>

					<div class="panel-body">

						<form class="form-horizontal row-border" name="formulario"
							action="adicionaFornecedor" method="post">

							

							<div class="form-group">

								<label class="col-md-2 control-label">Nome:</label>
								<div class="col-md-10">

									<div class="row">

										<div class="col-md-6">
											<input id="nome" name="nome" class="form-control input-md"
												type="text" value="${fornecedor.nome}">
											<form:errors path="fornecedor.nome" />									
										</div>
										<label class="col-md-2 control-label" for="cnpjcpf">CNPJ
											/ CPF:</label>
										<div class="col-md-4">
											<input id="cnpjCpf" name="cnpjCpf"
												class="form-control input-md" type="text"
												value="${fornecedor.cnpjCpf}" maxlength="18"
												onkeydown="javascript:return aplica_mascara_cpfcnpj(this,18,event)"
												onkeyup="javascript:return aplica_mascara_cpfcnpj(this,18,event)">
										</div>

									</div>
								</div>
							</div>

							<div class="form-group">

								<label class="col-md-2 control-label">CEP:</label>
								<div class="col-md-10">
									<div class="row">

										<div class="col-md-2">
											<input id="cep" name="cep" class="form-control input-md"
												onblur="atualizacep(this.value)" type="text"
												value="${fornecedor.cep}">

										</div>

										<label class="col-md-2 control-label" for="endereco">Endereço:</label>
										<div class="col-md-8">
											<input id="endereco" name="endereco"
												class="form-control input-md" type="text"
												value="${fornecedor.endereco}">

										</div>
									</div>
								</div>
							</div>


							<div class="form-group">

								<label class="col-md-2 control-label">Bairro:</label>
								<div class="col-md-10">

									<div class="row">

										<div class="col-md-3">
											<input id="bairro" name="bairro"
												class="form-control input-md" type="text"
												value="${fornecedor.bairro}">

										</div>

										<label class="col-md-2 control-label" for="cidade">Cidade:</label>
										<div class="col-md-3">
											<input id="cidade" name="cidade"
												class="form-control input-md" type="text"
												value="${fornecedor.cidade}">
										</div>
										<label class="col-md-2 control-label" for="uf">UF:</label>
										<div class="col-md-2">
											<select id="uf" name="uf" class="form-control">
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
											</select>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-2 control-label">Telefone:</label>
								<div class="col-md-10">

									<div class="row">

										<div class="col-md-3">
											<input id="telefone" name="telefone"
												class="form-control input-md" type="text"
												value="${fornecedor.telefone}">

										</div>
										<label class="col-md-2 control-label" for="fax">Fax:</label>
										<div class="col-md-3">
											<input id="fax" name="fax" class="form-control input-md"
												type="text" value="${fornecedor.fax}" onkeyup="fax()">

										</div>
										<label class="col-md-2 control-label" for="celular">Celular:</label>
										<div class="col-md-2">
											<input id="celular" name="celular"
												class="form-control input-md" type="text"
												value="${fornecedor.celular}">

										</div>

									</div>
								</div>
							</div>


							<div class="form-group"></div>

							<div class="form-group">
								<span class="add-on"><i class="icon-envelope"></i></span> <label
									class="col-md-2 control-label" for="textinput">Email:</label>
								<div class="col-md-10">
									<input id="email" name="email" class="form-control input-md"
										type="text" value="${fornecedor.email}">
										<form:errors path="fornecedor.email" />
								</div>
							</div>

							<div align="right">
								<a href="listaFornecedor" class="btn btn-danger btn-lg"
									type="submit">Cancelar</a> <input
									class="btn btn-primary btn-lg" type="submit" value="Salvar">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- JQuery Masked Input Java Script
    ================================================== -->

	<script type="text/javascript">
		jQuery(function($) {
			$("#cep").mask("99999-999");
			$("#telefone").mask("(99) 9999-9999");
			$("#fax").mask("(99) 9999-9999");

		});
	</script>


	<!-- Busca Cep Java Script
    ================================================== -->
	<script type="text/javascript" src="resources/js/buscacep.js">
		
	</script>

	<!-- Valida CPF e CNPJ Java Script
    ================================================== -->
	<script type="text/javascript" src="resources/js/validacpfcnpj.js"></script>

	<script>
		var campo = document.getElementById('cnpjcpf');
		//Mostra true se cpf/cnpj válido, false se inválido
		alert(verifica_cpf_cnpj(retira_mascara(campo.value)));
	</script>
</body>
</html>