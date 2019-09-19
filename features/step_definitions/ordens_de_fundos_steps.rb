# frozen_string_literal: true

Dado('que eu tenha investimentos em Fundos') do
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 05782575646 | teste123  | 15/04/1984 |
    Quando respondo a pergunta de segurança
  )
end

Quando("acesso Historico de investimentos") do
  @page.subnav.access_historico_investimentos
end

Então("devo ver listado minhas aplicações e resgates") do
  @page.ordem.select_date
  @page.ordem.verify_ordem_fundos
end

Quando("selecionar renda fixa") do
  @page.ordem.select_rendaFixa
end

Quando("eu filtro pela Renda Fixa {string}") do |busca|
  @page.ordem.filtro_buscar(busca)
end

Então("devo visualizar a Renda Fixa pesquisada") do |message|
  expect(page).to have_content message
end
