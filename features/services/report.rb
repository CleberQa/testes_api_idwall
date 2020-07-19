class Report
  include HTTParty

  base_uri ENVIRONMENT['api']['url']
  headers 'Content-Type': 'application/json', 'Authorization': AUTH['authentication']['token']

  def generate_report(date, name, document)
    self.class.post('/relatorios', body: { "matriz": 'consultaPessoaDefault', "parametros": { "cpf_data_de_nascimento":
      date, "cpf_nome": name, "cpf_numero": document } }.to_json)
  end

  def search_status_report(id)
    self.class.get("/relatorios/#{id}")
  end
end
