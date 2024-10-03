Dado('que eu tenha acessado o endereço {string}') do |string|
  visit 'https://smartspace.com.br'
end

Quando('eu preencher o campo email com valor {string}') do |string|
  find("[id^='rd-email_field-']").set(string)
end

E('eu preencher o campo celular com valor {string}') do |string|
  find("[id^='rd-phone_field-']").set(string)
end

E('eu escolher um item para o campo estado com valor {string}') do |string|
  find("[id^='rd-select_field-']").select(string)
end

E('eu preencher o campo empresa com valor {string}') do |string|
  find("#rd-text_field-lza3jr5t").set(string)
end

E('eu preencher o campo cargo com valor {string}') do |string|
  find("#rd-text_field-lza3jr5u").set(string)
end

E('eu clicar no botão Enviar') do
  find("[id^='rd-button-']").click
end

Então('eu devo ver uma mensagem informando que o campo obrigatório nome não foi preenchido') do
  mensagem = find('div.bricks-form__field:nth-child(1) > label:nth-child(3)')
  expect(mensagem.text).to eql 'Campo obrigatório'
end
