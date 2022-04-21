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

  result.to_json
end