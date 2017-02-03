require 'sinatra'
require './config'

get '/' do
	erb :index
end

get '/pull_request' do
	erb :pull_request
end