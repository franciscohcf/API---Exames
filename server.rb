require 'sinatra'
require 'active_record'
require './model/test_results.rb'

configure do
	set port: 3000
	set bind: '0.0.0.0'
end

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'clinickpg',
  username: 'clinick',
  password: 'clinick',
  database: 'clinickdb'
)

get '/tests/:token' do
  result = TestResults.where(result_token: params[:token])

  result = result.each_with_object({}) do |result_test, acc|
    acc['token'] = result_test['result_token']
    acc['date'] = result_test['result_date']
    acc['cpf'] = result_test['cpf']
    acc['name'] = result_test['name']
    acc['birthday'] = result_test['birthday']

    acc['doctor'] = {
      'name' => result_test['doctor_name'],
      'crm' => result_test['doctor_crm'],
      'crm_state' => result_test['doctor_crm_state']
    }

    acc['tests'] ||= []

    acc['tests'] << {
      'type' => result_test['test_type'],
      'limits' => result_test['test_limits'],
      'result' => result_test['result']
    }
  end

  
  result.to_json
end