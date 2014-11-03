function atualizacep(cep) {
			cep = cep.replace(/\D/g, "")
			url = "http://cep.correiocontrol.com.br/" + cep + ".js"
			s = document.createElement('script')
			s.setAttribute('charset', 'utf-8')
			s.src = url
			document.querySelector('head').appendChild(s)
		}

		function correiocontrolcep(valor) {
			if (valor.erro) {
				alert('Cep não encontrado');
				return;
			}
			;
			document.getElementById('endereco').value = valor.logradouro
			document.getElementById('bairro').value = valor.bairro
			document.getElementById('cidade').value = valor.localidade
			document.getElementById('uf').value = valor.uf
		}
