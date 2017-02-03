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
	pr = PullRequest.new
	pr.creador = params["creador"]
	pr.link_jira = params["link_jira"]
	pr.link_github = params["link_github"]

	@success = pr.save

	if !@success
		@error = "Los campos marcados con * son obligatorios"
	end

	erb :pull_request
end

get "/pull_requests/:id" do 
	@index = params[:id].to_i
	@pr = PullRequest.all[@index]
	erb :detail
end