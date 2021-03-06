require "../../spec_helper"

describe Gitlab::Client::Repository do
  describe ".tree" do
    it "should return a paginated response of repository tree files (root level)" do
      stub_get("/projects/3/repository/tree", "tree")
      tree = client.tree(3)

      tree.should be_a JSON::Any
      tree[0]["name"].as_s.should eq "app"
    end
  end

  describe ".compare" do
    it "should get diffs of a merge request" do
      params = {"from" => "master", "to" => "feature"}
      stub_get("/projects/3/repository/compare", "compare_merge_request_diff", params: params)
      diff = client.compare(3, "master", "feature")
      diff["diffs"][-1]["new_path"].as_s.should eq "files/js/application.js"
    end
  end

  describe ".blob_contents" do
    pending { "TODO" }
  end

  describe ".file_contents" do
    pending { "TODO" }
  end

  describe ".file_archive" do
    pending { "TODO" }
  end

  describe ".contributors" do
    pending { "TODO" }
  end
end
