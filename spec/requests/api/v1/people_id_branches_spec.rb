require "spec_helper"

describe "/people/:id/branches", type: :request do
  include_context "json response"
  include_context "access token"
  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_branches_path(person) }

  context :GET do
    let (:subject)    { person.branches }
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :branch
  end
end