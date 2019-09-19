# frozen_string_literal: true

Dado('que eu sou cadastrado') do
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
    | cpf         | password  | bday       |
    | 98960032034 | teste123  | 12/12/1980 |
    Quando respondo a pergunta de segurança
  )
end

Quando('acesso investimento em Fundos') do
  @page.navbar.access_investir
end

Então('devo ver listado as opcoes de Fundos') do
  @page.listafundos.view_list
end

Então('o botão Investir') do
  @page.listafundos.view_button_investir
end

Quando('entro no detalhe') do
  @page.listafundos.click_detail_fundo
end

Então('devo visualizar informações detalhadas de Principais Caracteristicas e Rentabilidade') do |mensagem|
  expect(page).to have_content mensagem
end
