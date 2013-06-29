require "spec_helper"

describe :people, type: :request do
  include_context "json response"
  include_context "access token"
  let!(:people)  { create_list :person, 3 }
  let (:subject) { Person.all[1] }

  describe "/people" do
    let (:http_path) { api_v1_people_path }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      let (:people) { Person.all }
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a json list for', :person
    end
  end

  describe "/people/:id" do
    let (:http_path) { api_v1_person_path(subject) }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a json item for', :person
    end
  end
end