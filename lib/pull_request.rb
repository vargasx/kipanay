class PullRequest

	attr_accessor :creador, :link_github, :link_jira,
		:dependencias, :critico, :revision_seguridad, :revision_staging, :revisions, :id

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
		@revisions = []
	end

	def save
		MANDATORY_FIELDS.each do |required_field|
			res = self.send(required_field)
			return false if res.nil? || res.empty?
		end
		if @id.nil?
			@id = @@pull_requests.size
			@@pull_requests << self
		else
			@@pull_requests[@id] = self
		end
		true
	end

	def self.all
		@@pull_requests
	end

	def self.clear
		@@pull_requests = []
	end

	def add_revision(revisor:, dependencias:,
		critico:, revision_seguridad:, revision_staging:, estado:)
		@revisions << {
			revisor: revisor, 
			dependencias: dependencias, 
			critico: critico,
			revision_seguridad: revision_seguridad,
			revision_staging: revision_staging,
			estado: estado
		}
		save
	end	

	def get_revisions
		return @revisions
	end
end