require './lib/pull_request'

describe PullRequest do

	it "returns 1 as id when saving a pull request" do
		pr = PullRequest.new(creator: "sergio", link_github: "link_1", link_jira: "link_2")		
		id = pr.save
		expect(id).to eq 1
	end

	it "returns a new id for each new pull request created" do
		pr = PullRequest.new(creator: "sergio", link_github: "link_1", link_jira: "link_2")		
		id1 = pr.save
		
		pr2 = PullRequest.new(creator: "sergio", link_github: "link_1", link_jira: "link_2")		
		id2 = pr2.save
		expect(id1).not_to eq id2
	end

end