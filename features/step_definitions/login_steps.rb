# frozen_string_literal: true

Dado('que acessei a página principal') do
  @page.login.go
end

Quando("eu faço login com a conta sem fundos:") do |table|
  @account = table.hashes.first
  @page.login.sign_in(@account['cpf'], @account['password'])
end

Quando("respondo a pergunta de segurança") do
  @page.login.answer_question(@account)
end

Então('vejo a área logada sem fundos') do
  client_name = find('.top-styles-acess li:nth-child(2)')
  expect(client_name).to have_content 'Luiz Antonio Attie Calil Jorge'
end

Quando("eu faço login com a conta com fundos:") do |table|
  @account = table.hashes.first
  @page.login.sign_in(@account['cpf'], @account['password'])
end

Então('vejo a área logada com fundos') do
  client_name = find('.top-styles-acess li:nth-child(2)')
  expect(client_name).to have_content 'Sheila Borges Bueno'
end

Quando("eu faço login com a senha incorreta:") do |table|
  @account = table.hashes.first
  @page.login.sign_in(@account['cpf'], @account['passowrd'])
end

Então('devo ver a mensagem de alerta de falha no login') do |alert|
  expect(@page.login.message_login_invalido).to eql alert
end

Quando("eu faço login com a conta sem CPF:") do |table|
  @account = table.hashes.first
  @page.login.sign_in(@account['cpf'], @account['passowrd'])
end

Então('devo ver a mensagem de alerta') do |mensagem|
  expect(page).to have_content mensagem
end

Quando("eu faço login com a conta sem Senha:") do |table|
  @account = table.hashes.first
  @page.login.sign_in(@account['cpf'], @account['passowrd'])
end

Então('acesso menu meus investimentos') do
  @page.login.access_investimentos
end
