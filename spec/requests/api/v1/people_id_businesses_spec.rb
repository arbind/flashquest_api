require "spec_helper"

describe "/people/:id/businesses", type: :request do
  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_businesses_path(person) }

  context :GET do
    let (:subject)    { businesses }
    before { extras = create_list :business, 5 }
    it_behaves_like "an array endpoint", :get, :business
  end
end