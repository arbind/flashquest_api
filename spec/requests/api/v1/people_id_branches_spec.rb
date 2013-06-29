require "spec_helper"

describe :people_id_branches, type: :request do
  include_context "json response"
  include_context "access token"

  let!(:businesses) { create_list :business, 3, :with_branches_and_patrons }
  let (:subject)   { Person.all.second }

  describe "/people/:id/branches" do
    let (:http_path)  { api_v1_person_branches_path(subject) }
    it_behaves_like "a protected endpoint", :get

    context :GET do
      let (:businesses) { create_list :business, 3, :with_branches_and_patrons }
      before { get http_path, nil, access_token_headers }
      it_behaves_like "a json list for", :branch
    end
  end
end