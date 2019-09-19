#language: pt

@investirFundos
Funcionalidade: Investir em Fundos
	Para ter acesso à posição consolidadas de Fundos
	Sendo um cliente que possui Fundos em minha carteira
	Posso consultar as informações consolidadas das minhas operações

	Cenário: Investir
		Dado que eu tenha saldo positivo em conta
		Quando escolho um ativo de Fundos para comprar
		E defino o valor para aplicação "50.000,00"
		Então devo ver a mensagem de sucesso
		"""
		Investimento realizado
		"""
