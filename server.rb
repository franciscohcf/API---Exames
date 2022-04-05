require 'sinatra'

configure do
	set port: 3000
	set bind: '0.0.0.0'
end

get '/tests/T9O6AI' do
	'Hello World!!'
end