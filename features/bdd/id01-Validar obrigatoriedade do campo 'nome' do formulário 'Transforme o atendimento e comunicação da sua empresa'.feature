# language: pt

Funcionalidade: Login

-Eu como usuário.
-Quero preencher o formulário 'Transforme o atendimento e comunicação da sua empresa' sem informar um nome
-Para validar obrigatoriedade do campo 'nome'.

Cenário: Validar obrigatoriedade de campo "nome" para formulário "Transforme o atendimento e comunicação da sua empresa" na homepage

    Dado que eu tenha acessado o endereço "https://smartspace.com.br"
    Quando eu preencher o campo email com valor "meu_email@smartspace.com.br"
        E eu preencher o campo celular com valor "99999999999"
        E eu escolher um item para o campo estado com valor "PB"
        E eu preencher o campo empresa com valor "SmartSpace"
        E eu preencher o campo cargo com valor "Analista de qualidade de software"
        E eu clicar no botão Enviar
    Então eu devo ver uma mensagem informando que o campo obrigatório nome não foi preenchido