require "spec_helper"

describe "/branches", type: :request do
  let!(:branches)   { create_list :branch, 3 }
  let (:http_path)  { api_v1_branches_path }

  context :GET do
    let (:subject)  { branches }
    it_behaves_like "an array endpoint", :get, :branch
  end

  describe "/:id" do
    let (:http_path)  { api_v1_branch_path(subject) }

    context :GET do
      let (:subject)  { Branch.all.second }
      it_behaves_like "an item endpoint", :get, :branch
    end
  end
end