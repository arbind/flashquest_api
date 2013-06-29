require "spec_helper"

describe :people, type: :request do
  include_context "json response"
  include_context "access token"

  let (:people)     { create_list :person, 3 }
  let (:businesses) { create_list :business, 3 }
  let (:a_person)   { people[1] }
  let (:branches)   {
    branches = []
    branch_list = []
    businesses.each do |b|
      (0..1).to_a.each { branches << create(:branch, business: b) }
    end
    i = 0
    branches.each do |b|
     if 0 == (i % 2)
        a_person.patronize(b)
        branch_list.push b
      end
      i += 1
    end
    branches
  }

  describe "/people" do
    let (:http_path)    { api_v1_people_path }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      before { people }
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a json list of people'
    end
  end

  describe "/people/:id" do
    let (:http_path) { api_v1_person_path(a_person) }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a json person'
    end

    describe "/people/:id/branches" do
      let (:http_path)  { api_v1_person_branches_path(a_person) }
      it_behaves_like "a protected endpoint", :get

      context :GET do
        before { branches }
        before { get http_path, nil, access_token_headers }
        it_behaves_like "a json list for", "branch"
      end
    end

    describe "/people/:id/businesses" do
      let (:http_path)  { api_v1_person_businesses_path(a_person) }
      it_behaves_like "a protected endpoint", :get

      context :GET do
        before { branches }
        before { extras = create_list :business, 5 }
        before { get http_path, nil, access_token_headers }
        it_behaves_like "a json list for", "business"
        it "has the right number of businesses" do
          expect(json_data.length).to eq businesses.length
        end
      end
    end

  end
end