#language: pt
#uft-8

Funcionalidade: Gerar relatorio das informações do usuário
  Eu como usuário do serviço de geração de relatório
  Quero gerar relatório com os dados do usuario
  Para disponilizar esses dados para consulta de outros sistemas

  @report @regression
  Cenário: Gerar relatório 
    Dado que pesquisar os dados de um usuário
    Então é gerado um id do relatório com o código 200

  @report @regression
  Cenário: Gerar relatório com dados vazios
    Dado que informar os dados vazios para pesquisar um usuário
    Então é exibido a mensagem de erro com o código 400

  @report @regression
  Cenário: Consultar relatório com a data de nascimento diferente do usuário
    Dado que informar a data de nascimento diferente para pesquisar um usuário
    Então é apresentando mensagem de erro da data de nascimento com o código 200

  @report @regression
  Cenário: Consultar relatório com o nome diferente do usuário
    Dado que informar o nome diferente para pesquisar um usuário
    Então é apresentando mensagem de erro do nome diferente com o código 200

  @report @regression
  Cenário: Consultar relatório valido
    Dado que pesquisar os dados de um usuário
    Então é apresentando o retorno valido do dados do usuário com o código 200
