require 'sinatra'
require './converter.rb'

configure do
	set port: 3000
	set bind: '0.0.0.0'
end

get '/tests/:token' do
  result = Converter.convert('result_tests.csv')

  result = result.select { |row| row['result_token'] == params['token'] }

  result = result.each_with_object({}) do | tests, acc |
    acc['result_token'] = tests['result_token']
    acc['result_date'] = tests['result_date']
    acc['cpf'] = tests['cpf']
    acc['name'] = tests['name']
    acc['email'] = tests['email']
    acc['birthday'] = tests['birthday']

    acc['doctor'] = {
      'name' => tests['doctor_name'],
      'crm' => tests['doctor_crm'],
      'crm_state' => tests['doctor_crm_state']
    }

    acc['tests'] ||= []

    acc['tests'] << {
      'type' => tests['test_type'],
      'limits' => tests['test_limits'],
      'result' => tests['result']
    }
  end

  result.to_json
end