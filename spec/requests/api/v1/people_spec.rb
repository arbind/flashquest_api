require "spec_helper"

describe "/people", type: :request do
  include_context "access token"
  include_context "json response"
  let!(:people)       { create_list :person, 3 }
  let (:http_path)    { api_v1_people_path }

  context :GET do
    let (:subject)    { people }
    before { get http_path, nil, access_token_headers }
    it_behaves_like 'a protected endpoint', :get
    it_behaves_like 'a json list for', :person
  end

  describe "/:id" do
    let (:http_path)  { api_v1_person_path(subject) }

    context :GET do
      let (:subject)  { Person.all.second }
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a protected endpoint', :get
      it_behaves_like 'a json item for', :person
    end
  end
end