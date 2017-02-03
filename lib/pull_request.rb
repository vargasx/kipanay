class PullRequest
	attr_accessor :creador, :link_github, :link_jira,
		:dependencias, :critico, :revision_seguridad, :revision_staging

		@@pull_requests = []

	def save
		@@pull_requests << self
	end

	def self.all
		@@pull_requests
	end
end