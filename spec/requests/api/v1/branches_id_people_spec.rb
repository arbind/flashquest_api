require "spec_helper"

describe "/branches/:id/people", type: :request do
  let!(:branches)     { create_list :branch, 3, :with_patrons }
  let (:branch)       { branches.second }
  let (:http_path)    { api_v1_branch_people_path(branch) }

  context :GET do
    let (:subject)    { branch.people }
    it_behaves_like "an array endpoint", :get, :person
  end
end