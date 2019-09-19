# frozen_string_literal: true

# Classe NavBar
class NavBar < BasePage
  def access_minha_conta
    click_on 'Minha Conta', wait: 5
  end

  def access_investir
    click_on 'Investir', wait: 5
  end

  def access_meu_guia
    click_on 'Meu guia', wait: 5
  end
end
