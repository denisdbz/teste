# frozen_string_literal: true

# Classe SubNav
class SubNav < BasePage
  def access_visao_geral
    click_on 'Visão Geral', wait: 5
  end

  def access_investimentos
    click_on 'Meus investimentos', wait: 5
  end

  def access_transferencia
    click_on 'Transferência', wait: 5
  end

  def access_historico_investimentos
    click_on 'Histórico de investimentos', wait: 5
  end

  def access_extrato
    click_on 'Extrato', wait: 5
  end

  def access_ferramentas
    click_on 'Ferramentas', wait: 5
  end
end
