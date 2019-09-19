# frozen_string_literal: true

# Classe ListarFundos
class ListarFundosPage < BasePage

  def view_list
    (raise 'Lista NOK' unless page.has_selector?(:css, '.content-section-card'))
  end

  def view_button_investir
    (raise 'Botão NOK' unless page.has_selector?(:css, '.submit-btn'))
  end

  def click_detail_fundo
    find('#mat-expansion-panel-header-26').click
  end
  
end
