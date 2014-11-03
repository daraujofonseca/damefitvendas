package br.com.damefit.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.damefit.dao.FornecedorDao;
import br.com.damefit.modelo.Fornecedor;

@Controller
public class FornecedorController {
	@RequestMapping("novoFornecedor")
	public String form() {
		return "fornecedor/novoFornecedor";
	}

	@RequestMapping("adicionaFornecedor")
	public String adiciona(@Valid Fornecedor fornecedor, BindingResult result) {
	
		ObjectError error = new ObjectError("nome",
				"Já existe um fornecedor cadastro com esse nome.");
		result.addError(error);

		FornecedorDao dao = new FornecedorDao();

		if (dao.buscaDuplicados(fornecedor)) {

			result.rejectValue("nome", "error.fornecedor",
					"Já existe um fornecedor cadastro com esse nome.");

			return "fornecedor/novoFornecedor";

		} else

		if (result.hasFieldErrors()) {
			return "fornecedor/novoFornecedor";
		}

		dao.adiciona(fornecedor);
		return "redirect:listaFornecedor";

	}

	@RequestMapping("listaFornecedor")
	public String lista(Model model) {
		FornecedorDao dao = new FornecedorDao();
		model.addAttribute("fornecedores", dao.lista());
		return "fornecedor/listaFornecedor";
	}

	@RequestMapping("removeFornecedor")
	public String remove(Fornecedor fornecedor) {
		FornecedorDao dao = new FornecedorDao();
		dao.remove(fornecedor);
		return "redirect:listaFornecedor";
	}

	@RequestMapping("mostraFornecedor")
	public String mostra(Long id, Model model) {
		FornecedorDao dao = new FornecedorDao();
		model.addAttribute("fornecedor", dao.buscaPorId(id));
		return "fornecedor/mostraFornecedor";
	}

	@RequestMapping("alteraFornecedor")
	public String altera(Fornecedor fornecedor) {
		FornecedorDao dao = new FornecedorDao();
		dao.altera(fornecedor);
		return "redirect:listaFornecedor";
	}

}
