require 'sinatra'

configure do
	set port: 3000
	set bind: '0.0.0.0'
end

get '/tests' do
end