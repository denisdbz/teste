# frozen_string_literal: true

# Classe LoginPage
class LoginPage < BasePage

  def go
    visit '/login'
  end

  def sign_in(document, password)
    fill_in 'mat-input-0', with: document
    fill_in 'mat-input-1', with: password
    click_on 'ENTRAR'
  end

  def question
    find('.content-question', wait: 5).text
  end

  def answer_question(account)
    case question
    when 'QUAIS SÃO OS TRÊS PRIMEIROS DIGITOS DO SEU CPF'
      @target = account['cpf'].slice(0..2)
    when 'QUAL O DIA DO SEU NASCIMENTO'
      @target = account['bday'].slice(0..1)
    when 'QUAL O MÊS DO SEU NASCIMENTO'
      @target = account['bday'].slice(3..4)
    when 'QUAL O ANO DE SEU NASCIMENTO'
      @target = account['bday'].slice(6..9)
    else
      raise "Pergunta de segurança não encontrada! #{question}"
    end

    find('.mat-dialog-container input').set @target
    click_on 'CONTINUAR'
  end

  def logged_area_sem_fundos
    client_name = find('.top-styles-acess li:nth-child(2)')
    expect(client_name).to have_content 'Luiz Antonio Attie Calil Jorge'
  end

  def logged_area_com_fundos
    client_name = find('.top-styles-acess li:nth-child(2)')
    expect(client_name).to have_content 'Sheila Borges Bueno'
  end

  def message_login_invalido
    find('.simple-notification-wrapper.top right').text
  end

  def login_failed(message)
    failed = find('.mmat-error')
    expect(failed).to have_content message
  end
  
end
