
Dado("que o meu perfil de cliente não seja qualificado") do
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 15358845844 | teste123  | 29/12/1972 |
    Quando respondo a pergunta de segurança
  )
  @page.navbar.access_investir
end

Dado("que o meu perfil de cliente seja qualificado") do
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 14335003889 | teste123  | 07/07/1970 |
    Quando respondo a pergunta de segurança
  )
  @page.navbar.access_investir
end

Quando("invisto em um Fundo qualificado com o valor de {string}") do |valor|
  @page.investir.select_fundo
  @page.investir.click_investir
  expect(page).to have_content "Investidores Qualificados"
  @page.investir.continue
  @page.investir.value_invest(valor)
end

Quando("invisto em um Fundo com o valor de {string}") do |valor|
  @page.investir.select_fundo
  @page.investir.click_investir
  @page.investir.value_invest(valor)
end

Então("devo visualizar a mensagem") do |mensagem|
  expect(page).to have_content mensagem
  @page.investir.click_exit
end