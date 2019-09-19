# frozen_string_literal: true

Dado("que eu tenha aplicação com saldo para resgate maior que {string}") do |valor|
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 22848531886 | teste123  | 21/02/1986 |
    Quando respondo a pergunta de segurança
  )
  @page.subnav.access_investimentos
  @page.resgate.click_fundos
  @page.resgate.click_resgate
end

Dado('que eu tenha um investimento ativo') do
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 08867181807 | teste123  | 05/09/1962 |
    Quando respondo a pergunta de segurança
  )
  @page.subnav.access_investimentos
  @page.resgate.click_fundos
end

Dado('que eu tenha saldo positivo em conta') do
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 10287352781 | teste123  | 17/10/1984 |
    Quando respondo a pergunta de segurança
  )
  @page.subnav.access_investimentos
  @page.resgate.click_fundos
end

Dado("o valor minimo para resgate de {string}") do |valor|
  expect(@page.resgate.value_resgate).to eql valor
end

Quando('solicitar um resgate parcial de {string}') do |valor|
  @page.resgate.value_resgate(valor)
  @page.resgate.tab_resgate
end

Então('devo ver a mensagem') do |alert|
  expect(page).to have_content alert
end

Quando("abro as informações da minha carteira") do
  @page.subnav.access_investimentos
end

Quando('clico no ocultar visualizador') do
  @page.resgate.click_eye
end

Então('devo ver os valores ocultos e ver apenas o {string}') do |valor_oculto|
  expect(@page.resgate.view_value).to eql valor_oculto
end

Quando("clico no botão de resgate") do
  @page.resgate.click_resgate
end

Quando('informo o valor de {string}') do |valor|
  @page.resgate.value_resgate(valor)
  @page.resgate.click_continue_resgate
end

Então('devo ver a mensagem de sucesso de resgate') do |message|
  expect(@page.resgate.view_message_resgate).to eql message
end

Quando('escolho um ativo de Fundos para comprar') do
  @page.resgate.click_investir
end

Quando("defino o valor para aplicação {string}") do |valor|
  @page.resgate.value_investir(valor)
end

Então('devo ver a mensagem de sucesso') do |mensagem|
  expect(page).to have_content mensagem
end

Quando('eu clico em um determinado fundo') do
  @page.resgate.select_fundo
end

Então("devo visualizar o Resumo e suas caracteristicas.") do |alert|
  expect(page).to have_content alert
end
