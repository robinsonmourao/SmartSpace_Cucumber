class HomePage < SitePrism::Page
  set_url 'https://smartspace.com.br'

  element :nome_input, "[id^='rd-text_field-']"
  element :email_input, "[id^='rd-email_field-']"
  element :telefone_input, "[id^='rd-phone_field-']"
  element :estado_select, "[id^='rd-select_field-']"
  element :empresa_input, "#rd-text_field-lza3jr5t"
  element :cargo_input, "#rd-text_field-lza3jr5u"
  element :enviar_button, "[id^='rd-button-']"

  def preencher_rd_nome(valor)
    nome_input.set valor
  end

  def preencher_rd_email(valor)
    email_input.set valor
  end

  def preencher_rd_telefone(valor)
    telefone_input.set valor
  end

  def selecionar_rd_estado(valor)
    estado_select.select(valor)
  end

  def preencher_rd_empresa(valor)
    empresa_input.set valor
  end

  def preencher_rd_cargo(valor)
    cargo_input.set valor
  end

  def clicar_enviar
    enviar_button.click
  end
end
