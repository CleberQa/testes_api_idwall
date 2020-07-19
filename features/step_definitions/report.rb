Dado(/^que pesquisar os dados de um usuário$/) do
  @resposta = Report.new.generate_report(DATA['user']['birth_date'], DATA['user']['name'], DATA['user']['document'])
  @id_report = @resposta['result']['numero']
end

Dado(/^que informar os dados vazios para pesquisar um usuário$/) do
  @resposta = Report.new.generate_report('', '', '')
end

Dado(/^que informar a data de nascimento diferente para pesquisar um usuário$/) do
  @resposta = Report.new.generate_report(DATA['user']['birth_date_invalid'], DATA['user']['name'], DATA['user']['document'])
  @id_date = @resposta['result']['numero']
end

Dado(/^que informar o nome diferente para pesquisar um usuário$/) do
  @resposta = Report.new.generate_report(DATA['user']['birth_date'], DATA['user']['name_invalid'], DATA['user']['document'])
  @id_name = @resposta['result']['numero']
end

Então(/^é gerado um id do relatório com o código (\d+)$/) do |codigo|
  expect(@resposta.code).to eq codigo.to_i
  puts "Status Code: #{@resposta.code}"
  puts "ID do relatório: #{@resposta['result']['numero']}"
end

Então(/^é exibido a mensagem de erro com o código (\d+)$/) do |codigo|
  expect(@resposta.code).to eq codigo.to_i
  puts "Status Code: #{@resposta.code}"
  puts "Erro: #{@resposta['error']}"
  puts "Mensagem de erro: #{@resposta['message']}"
end

Então(/^é apresentando mensagem de erro da data de nascimento com o código (\d+)$/) do |codigo|
  loop do
    @resposta = Report.new.search_status_report @id_date
    if @resposta['result']['status'] == MESSAGE['msg']['status_concluido']
      break
    end
  end
  expect(@resposta.code).to eq codigo.to_i
  expect(@resposta['result']['mensagem']).to eq MESSAGE['msg']['birth_date_invalid']
  expect(@resposta['result']['resultado']).to eq MESSAGE['msg']['resultado_invalid']
  puts "Status Code: #{@resposta.code}"
  puts "Status do relatório: #{@resposta['result']['status']}"
  puts "Mensagem do Status do relatório: #{@resposta['result']['mensagem']}"
  puts "Resultado do relatório: #{@resposta['result']['resultado']}"
end

Então(/^é apresentando mensagem de erro do nome diferente com o código (\d+)$/) do |codigo|
  loop do
    @resposta = Report.new.search_status_report @id_name
    if @resposta['result']['status'] == MESSAGE['msg']['status_concluido']
      break
    end
  end
  expect(@resposta.code).to eq codigo.to_i
  expect(@resposta['result']['mensagem']).to eq('Inválido. [INVALID] Nome diferente do cadastrado na Receita Federal. [INVALID] Não foi possível emit...IAFEDERAL). Não é possível verificar se a pessoa possui antecedentes criminais, dados não conferem.')
  expect(@resposta['result']['resultado']).to eq MESSAGE['msg']['resultado_invalid']
  puts "Status Code: #{@resposta.code}"
  puts "Status do relatório: #{@resposta['result']['status']}"
  puts "Mensagem do Status do relatório: #{@resposta['result']['mensagem']}"
  puts "Resultado do relatório: #{@resposta['result']['resultado']}"
end

Então(/^é apresentando o retorno valido do dados do usuário com o código (\d+)$/) do |codigo|
  loop do
    @resposta = Report.new.search_status_report @id_report
    if @resposta['result']['status'] == MESSAGE['msg']['status_concluido']
      break
    end
  end
  expect(@resposta.code).to eq codigo.to_i
  expect(@resposta['result']['resultado']).to eq MESSAGE['msg']['resultado_valid']
  puts "Status Code: #{@resposta.code}"
  puts "Status do relatório: #{@resposta['result']['status']}"
  puts "Mensagem do Status do relatório: #{@resposta['result']['mensagem']}"
  puts "Resultado do relatório: #{@resposta['result']['resultado']}"
end