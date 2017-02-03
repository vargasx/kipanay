require 'sinatra'
require './config'

get '/' do
	erb :index
end

get '/pull_requests/new' do
	erb :pull_request
end

post '/pull_requests' do
	@success = false
	if params['creador'].empty?
		@error = "Los campos marcados con * son obligatorios"
	else
		@success = true
	end
	erb :pull_request
end