package br.com.damefit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaginaInicial {
	
	@RequestMapping("")
	public String execute(){
		return "home";
	}

}
