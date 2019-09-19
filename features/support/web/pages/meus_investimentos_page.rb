# frozen_string_literal: true

# Classe Meus Investimentos
class MeusInvestimentosPage < BasePage

  def click_fundos
    first('.mat-expansion-panel-header-description').click
  end

  def click_resgate
    first('.button-rescue').click
  end

  def click_investir
    first('.button-apply', wait: 5).click
  end

  def value_min
    # find('#modal-rescue-fund .min-value-withdraw:nth-child(2)').text.gsub('R$ ', '')
    find('.col-md-3.rescue-form-info-strong.min-value-withdraw').text.gsub('R$ ', '')
  end

  def value_resgate(valor)
    find('.mat-input-element').set(value)
  end

  def tab_resgate
    tab = find('.mat-input-element')
    tab.send_keys :tab
  end

  def click_continue_resgate
    find('.submit-btn').click
    click_on 'Confirmar'
  end

  def value_investir(valor)
    first('.mat-input-element').set(value)
    click_on 'Continuar'
    click_on 'Confirmar'
  end

  def click_total_resgate
    click_on 'Total'
  end

  def click_eye
    find('.material-icons').click
  end

  def view_value
    find('.dashboard-card-content .card-item:nth-child(1) .d-flex .bd-highlight:nth-child(2)').text.gsub("\n", ' ')
  end

  def view_message_resgate
    texto_esperado = wait_and_text('div.mat-horizontal-content-container div.mat-horizontal-stepper-content .title-1')
    texto_esperado
  end

  def select_fundo
    first('.mat-content', wait: 5).click
  end
  
end
