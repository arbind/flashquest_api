require "spec_helper"

describe "/people/:id/businesses", type: :request do
  include_context "json response"
  include_context "access token"
  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_businesses_path(person) }

  context :GET do
    let (:subject)    { businesses }
    before { extras = create_list :business, 5 }
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :business
  end
end