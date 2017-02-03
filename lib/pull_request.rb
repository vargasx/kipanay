<<<<<<< HEAD
class PullRequest
	attr_accessor :creador, :link_github, :link_jira,
		:dependencias, :critico, :revision_seguridad, :revision_staging
=======
require 'csv'
class PullRequest

	def initialize creator:, link_github:, link_jira: 
	end

	def save
		CSV.open("prs.csv", "wb") do |csv|
  		csv << [@creator, @link_github, @link_jira]
  	end
  	1

  end
>>>>>>> Agregando PR table

end