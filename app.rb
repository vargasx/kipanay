require 'sinatra'
require './config'
require './lib/pull_request'

get '/' do
	@pull_requests = PullRequest.all
	erb :index
end

get '/pull_requests/new' do
	erb :pull_request
end

post '/pull_requests' do
	pr = PullRequest.new(params)

	@success = pr.save

	if !@success
		@error = "Los campos marcados con * son obligatorios"
	end

	erb :pull_request
end