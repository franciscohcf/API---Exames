require 'sinatra'
require 'active_record'
require './converter.rb'
require './seed.rb'
require './formater.rb'
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

get '/import/:filename' do
  initial_time = Time.now

  data = Converter.convert(params[:filename])

  Seed.to_db(data)

  "Done in #{Time.now - initial_time} seconds"
end

get '/tests/:token' do
  result = TestResults.where(result_token: params[:token])

  result = Formater.format(result)
  
  result.to_json
end