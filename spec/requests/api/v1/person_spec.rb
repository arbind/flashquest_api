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

  describe "/people/:id" do
    let (:a_person)  { people[1] }
    let (:http_path) { api_v1_person_path(a_person) }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a json person'
    end

    describe "/people/:id/branches" do
      let (:businesses) {create_list :business, 8 }
      let (:a_person)   { create :person }
      let (:http_path) { api_v1_person_branches_path(a_person) }
      it_behaves_like "a protected endpoint", :get

      context :GET do
        before do
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
        end
        before { get http_path, nil, access_token_headers }
        it_behaves_like "a json list for", "branch"
      end
    end
  end
end