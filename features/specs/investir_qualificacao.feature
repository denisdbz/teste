#language: pt

@qualificado
Funcionalidade: Termo de Qualificação
Para investir em Fundos
Sendo um cliente com perfil de qualificação
Posso concluir o investimento

Cenário: Perfil do cliente sem qualificação
  Dado que o meu perfil de cliente não seja qualificado
  Quando invisto em um Fundo qualificado com o valor de "1.000,00"
  Então devo visualizar a mensagem
  """
  Investimento realizado
  """
  
Cenário: Perfil do cliente com qualificação
  Dado que o meu perfil de cliente seja qualificado
  Quando invisto em um Fundo com o valor de "1.000,00"
  Então devo visualizar a mensagem
  """
  Investimento realizado
  """