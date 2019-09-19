
Dado("que o meu perfil de cliente seja menor que o perfil do fundo") do
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 13326597649 | teste123  | 07/04/1942 |
    Quando respondo a pergunta de segurança
  )
  @page.navbar.access_investir
end

Dado("que estou no Step de desenquadramento {string}") do |valor|
  steps %(
    Dado que acessei a página principal
    Quando eu faço login com a conta com fundos:
      | cpf         | password  | bday       |
      | 13326597649 | teste123  | 07/04/1942 |
    Quando respondo a pergunta de segurança
  )
  @page.navbar.access_investir
  @page.investir.select_fundo
  @page.investir.click_investir
  @page.investir.value_invest(valor)
end

Quando("invisto em um Fundo com perfil Agressivo {string}") do |valor|
  @page.investir.select_fundo
  @page.investir.click_investir
  @page.investir.value_invest(valor)
end

Então("devo ser avisado que estou operando desenquadrado") do |message|
  expect(page).to have_content message
end

Quando("clico em Não, Voltar") do
  @page.investir.click_back
end

Então("devo retornar ao Step anterior") do |message|
  expect(page).to have_content message
end