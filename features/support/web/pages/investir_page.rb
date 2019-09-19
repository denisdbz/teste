# frozen_string_literal: true

# Classe Investir
class InvestirPage < BasePage

  def select_fundo
    find('.mat-input-element').set 'AAA Ações'
  end

  def click_investir
    find('.submit-btn').click
  end

  def click_investir_select
    first('.submit-btn').click
  end

  def click_back
    click_on "Não, voltar"
  end

  def continue
    click_on 'Sim, continuar'
  end

  def value_invest(value)
    first('.ng-untouched.ng-pristine.ng-invalid .mat-form-field div div div input').set(value)
    click_on 'Continuar'
    click_on 'Confirmar'
  end

  def click_exit
    click_on 'Concluir'
  end
  
  def select_risco_muito_alto
    choose('Muito alto')
  end

end
