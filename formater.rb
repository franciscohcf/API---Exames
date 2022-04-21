class Formater
  def self.format(data)
    data.each_with_object({}) do |data_test, acc|
      acc['token'] = data_test['result_token']
      acc['date'] = data_test['result_date']
      acc['cpf'] = data_test['cpf']
      acc['name'] = data_test['name']
      acc['birthday'] = data_test['birthday']
  
      acc['doctor'] = {
        'name' => data_test['doctor_name'],
        'crm' => data_test['doctor_crm'],
        'crm_state' => data_test['doctor_crm_state']
      }
  
      acc['tests'] ||= []
  
      acc['tests'] << {
        'type' => data_test['test_type'],
        'limits' => data_test['test_limits'],
        'result' => data_test['result']
      }
    end
  end
end