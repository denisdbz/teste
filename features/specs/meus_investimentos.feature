#language: pt

@resgate
Funcionalidade: Resgatar fundos
	Para receber o dinheiro que tive rentabilidade
	Sendo um cliente com investimento em Fundos
	Posso solicitar o resgate

	Cenário: Resgate financeiro parcial com valor menor que o mínimo
		Dado que eu tenha aplicação com saldo para resgate maior que "100,00"
		Quando solicitar um resgate parcial de "10,00"
		Então devo ver a mensagem 
		"""
		Valor mínimo de resgate neste fundo é de R$
		"""

	Cenário: Resgate financeiro parcial com valor maior que o total para resgate
		Dado que eu tenha aplicação com saldo para resgate maior que "100,00"
		Quando solicitar um resgate parcial de "999999999.999,9999999999"
		Então devo ver a mensagem 
		"""
		Valor máximo disponível para resgate neste fundo é
		"""

	Cenário: Resgatar com sucesso
			Dado que eu tenha um investimento ativo
			Quando clico no botão de resgate
			E informo o valor de "100,00"
			Então devo ver a mensagem de sucesso de resgate
		"""
		Resgate confirmado
		"""
		
	Cenário: Ocultar valores
		Dado que eu sou cadastrado
		Quando abro as informações da minha carteira
		E clico no ocultar visualizador
		Então devo ver os valores ocultos e ver apenas o "R$ - Exibir Valores"

	Cenário: Detalhe da posição consolidada (Resumo e Características)
		Dado que eu tenha um investimento ativo
		Quando eu clico em um determinado fundo
		Então devo visualizar o Resumo e suas caracteristicas.
		"""
		Resumo
		"""