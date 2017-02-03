class PullRequest

	attr_accessor :creador, :link_github, :link_jira,
		:dependencias, :critico, :revision_seguridad, :revision_staging

		@@pull_requests = []
		MANDATORY_FIELDS = [:creador, :link_github, :link_jira]

	def initialize(params={})
		@creador = params["creador"]
		@link_jira = params["link_jira"]
		@link_github = params["link_github"]
		@dependencias = params["dependencias"]
		@critico = params["critico"]
		@revision_seguridad = params["revision_seguridad"]
		@revision_staging = params["revision_staging"]
	end

	def save
		MANDATORY_FIELDS.each do |required_field|
			res = self.send(required_field)
			return false if res.nil? || res.empty?
		end
		@@pull_requests << self
	end

	def self.all
		@@pull_requests
	end

	def self.clear
		@@pull_requests = []
	end
end