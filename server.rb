require 'sinatra'
require 'csv'
require './converter.rb'

configure do
	set port: 3000
	set bind: '0.0.0.0'
end

get '/tests/:token' do
	data = CSV.read('result_tests.csv', col_sep: ';')

  result = Converter.convert(data)

  result = result.select { |row| row['result_token'] == params['token'] }

  result.to_json
end