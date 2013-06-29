require "spec_helper"

describe :people_id_businesses, type: :request do
  include_context "json response"
  include_context "access token"
  let!(:businesses) { create_list :business, 3, :with_branches_and_patrons }
  let (:subject)    { Person.all.second }

  describe "/people/:id/businesses" do
    let (:http_path)  { api_v1_person_businesses_path(subject) }
    it_behaves_like "a protected endpoint", :get

    context :GET do
      before { extras = create_list :business, 5 }
      before { get http_path, nil, access_token_headers }
      it_behaves_like "a json list for", :business
      it "has the right number of businesses" do
        expect(json_data.length).to eq businesses.length
      end
    end
  end
end