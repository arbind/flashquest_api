require "spec_helper"

describe "/people/:id/branches", type: :request do
  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_branches_path(person) }

  context :GET do
    let (:subject)    { person.branches }
    it_behaves_like   "an array endpoint", :get, :branch
 end
end