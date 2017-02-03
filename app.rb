require 'sinatra'
require './config'

get '/' do
	erb :index
end

get '/pull_requests/new' do
	erb :pull_request
end

post '/pull_requests' do
	erb :show
end