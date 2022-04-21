require 'active_record'
require './converter.rb'
require './model/test_results.rb'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'clinickpg',
  username: 'clinick',
  password: 'clinick',
  database: 'clinickdb'
)

class Seed
  result = Converter.convert('result_tests.csv')

  result.each do |row|
    TestResults.create(cpf: row['cpf'], name: row['name'], email: row['email'], birthday: row['birthday'], street_address: row['street_address'], city_address: row['city_address'],
                       state_address: row['state_address'], doctor_crm: row['doctor_crm'], doctor_crm_state: row['doctor_crm_state'], doctor_name: row['doctor_name'],
                       doctor_email: row['doctor_email'], result_token: row['result_token'], result_date: row['result_date'], test_type: row['test_type'], test_limits: row['test_limits'],
                      result: row['result'])
  end
end
