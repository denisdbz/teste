#language: pt

@desenquadrado
Funcionalidade: Termo desenquadramento para fundos
  Para investir em Fundos
  Sendo um cliente com perfil menor que o perfil do Fundo
  Posso concluir o investimento com um aceite de desenquadramento

  Cenário: Perfil do cliente inferior ao perfil do Fundo
    Dado que o meu perfil de cliente seja menor que o perfil do fundo
    Quando invisto em um Fundo com perfil Agressivo "5.000,00"
    Então devo ser avisado que estou operando desenquadrado
    """
    A operação que pretende realizar não é adequada ao seu perfil:
    """
  
  Cenário: Voltar ao Step anterior
    Dado que estou no Step de desenquadramento "5.000,00"
    Quando clico em Não, Voltar
    Então devo retornar ao Step anterior
    """
    Valor do investimento
    """