# frozen_string_literal: true

# Classe Ordem de Fundos
class OrdemDeFundosPage < BasePage

  def verify_ordem_fundos
    (raise 'Usuario sem fundos!' unless page.has_selector?(:css, '.table-responsive-lg table tbody tr:nth-child(1)'))
  end

  def select_rendaFixa
    find('.mat-select-value').click
    find('.mat-option-text', text: 'Renda fixa').click
  end

  def filtro_buscar(busca)
    buscar = find('.mat-form-field-infix input').set ("busca")
    buscar.send_keys :tab, wait: 5
  end

  def select_date
    filtro = find(:xpath, '/html/body/guide-root/guide-dashboard/div/guide-wallet/div[2]/guide-investment-history/mat-card/mat-card-content/div[1]/div/div/div[3]/guide-date-range-picker/input').set '08/07/2010 - 08/07/2019'
    filtro.send_keys :tab, wait: 5
  end
end
