#language: pt

@login
Funcionalidade: Acesso do cliente
  Para ter acesso as operações de investimentos
  Sendo um cliente cadastrado
  Posso acessar o portal Guide

  Cenário: Acesso sem fundos
    Dado que acessei a página principal
    Quando eu faço login com a conta sem fundos:
      | cpf         | password  | bday       |
      | 19610331866 | teste123  | 28/06/1972 |
    E respondo a pergunta de segurança
    Então vejo a área logada sem fundos

  Cenário: Acesso com fundos
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 22848531886 | teste123  | 21/02/1986 |
    E respondo a pergunta de segurança
    Então vejo a área logada com fundos

  Cenario: Sem CPF
    Dado que acessei a página principal
    Quando eu faço login com a conta sem CPF:
      | cpf         | password  |
      |             | 123456    |
    Então devo ver a mensagem de alerta
    """
    Campo obrigatório
    """

  Cenario: Sem Senha
    Dado que acessei a página principal
    Quando eu faço login com a conta sem Senha:
      | cpf         | password  |
      | 35271320820 |           |
    Então devo ver a mensagem de alerta
    """
    Campo obrigatório
    """







    
