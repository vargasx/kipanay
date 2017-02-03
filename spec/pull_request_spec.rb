require './lib/pull_request'
describe PullRequest do
	
	it "asigna los valores de los campos" do
		pr = PullRequest.new
		pr.creador = "creador"
		pr.link_github = "https://ssss"
		pr.link_jira = "https://aaaa"
		pr.critico = true
		pr.revision_seguridad = true
		pr.revision_staging = true
		pr.dependencias = "dep1, dep2"

		expect(pr.creador).to eq "creador"
		expect(pr.link_github).to eq "https://ssss"
		expect(pr.link_jira).to eq "https://aaaa"
		expect(pr.critico).to eq true
		expect(pr.revision_seguridad).to eq true
		expect(pr.revision_staging).to eq true
		expect(pr.dependencias).to eq "dep1, dep2"
	end

	it "retorna lista de prs guardados" do
		pr = PullRequest.new
		pr.creador = "creador"
		pr.link_github = "https://ssss"
		pr.link_jira = "https://aaaa"
		pr.save

		lista = PullRequest.all
		expect(lista).to eq [pr]
	end

	it "retorna false cuando falta campo obligatorio" do
		pr = PullRequest.new
		expect(pr.save).to be false
	end

	it "retorna false cuando falta campo obligatorio link_jira" do
		pr = PullRequest.new
		pr.creador = "creador"
		pr.link_github = "https://ssss"
		pr.link_jira = ""
		expect(pr.save).to be false
	end

	it "agrega una revision al PR" do
		pr = PullRequest.new
		pr.creador = "creador"
		pr.link_github = "https://github"
		pr.link_jira = "https://jira"
		pr.save

		response = pr.add_revision(
			revisor: "apineda", 
			dependencias: "ninguna", 
			critico: false,
			revision_seguridad: false,
			revision_staging: true,
			estado: 'aprobado')
		expect(response).to be true	
	end

	it 'obtiene una revsion del PR' do
		pr = PullRequest.new
		pr.creador = "creador"
		pr.link_github = "https://github"
		pr.link_jira = "https://jira"
		pr.save

		params = {
			revisor: "apineda", 
			dependencias: "ninguna", 
			critico: false,
			revision_seguridad: false,
			revision_staging: true,
			estado: 'aprobado'
		}
		pr.add_revision(params)

		revisions = pr.get_revisions()
		expect(revisions).to eq([params])
	end
end