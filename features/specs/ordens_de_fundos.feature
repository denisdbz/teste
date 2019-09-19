#language: pt

@listarOrdem
Funcionalidade: Consultar as ordens de Fundos
  Para ter acesso aos meus resgates e aplicações em Fundos
  Sendo um cliente com uma ou mais contas ativa(s)
  Posso consultar meu histórico de investimentos e de resgate

Cenário: Listar as ordens de Fundos
  Dado que eu tenha investimentos em Fundos
  Quando acesso Historico de investimentos
  Então devo ver listado minhas aplicações e resgates

Cenário: Listar as ordens de Fundos Renda Fixa
  Dado que eu tenha investimentos em Fundos
  Quando acesso Historico de investimentos
  E selecionar renda fixa
  Então devo ver listado minhas aplicações e resgates

@temp
Cenário: Filtragem por texto
  Dado que eu tenha investimentos em Fundos
  Quando eu filtro pela Renda Fixa "CDB"
  Então devo visualizar a Renda Fixa pesquisada
		"""
		CDB
		"""
