require "spec_helper"

describe :people, type: :request do
  include_context "json response"
  include_context "access token"

  let (:people) { create_list :person, 3 }

  describe "/people" do
    let (:http_path)    { api_v1_people_path }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      before { people }
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a json list of people'
    end
  end
end