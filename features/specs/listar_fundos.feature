#language: pt

@listar
Funcionalidade: Listar Fundos
  Para que eu possa investir em Fundos
  Sendo um cliente cadastrado
  Posso visualizar os opções de Fundos de Investimento

Cenário: Listar Fundos e visualizar botao "Investir"
  Dado que eu sou cadastrado
  Quando acesso investimento em Fundos
  Então devo ver listado as opcoes de Fundos
  E o botão Investir

Cenário: Detalhe do Fundo
  Dado que eu sou cadastrado
  Quando acesso investimento em Fundos
  E entro no detalhe
  Então devo visualizar informações detalhadas de Principais Caracteristicas e Rentabilidade
  """
  Principais características
  """
    