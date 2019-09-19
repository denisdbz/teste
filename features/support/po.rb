# frozen_string_literal: true

# Classe PageObject
class PageObject

  def login
    LoginPage.new
  end

  def resgate
    MeusInvestimentosPage.new
  end

  def subnav
    SubNav.new
  end

  def navbar
    NavBar.new
  end

  def ordem
    OrdemDeFundosPage.new
  end

  def listafundos
    ListarFundosPage.new
  end

  def investir
    InvestirPage.new
  end
  
end
