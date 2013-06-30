require "spec_helper"

describe "/branches/:id/patrons", type: :request do
  let!(:branches)   { create_list :branch, 3, :with_patrons }
  let (:branch)     { branches.second }
  let (:http_path)  { api_v1_branch_patrons_path(branch) }

  context :GET do
    let (:subject)  { branch.patrons }
    it_behaves_like "an array endpoint", :get, :patron
  end
end