require "spec_helper"

describe "/people/:id/quests", type: :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_quests_path(person) }

  context :GET do
    let (:subject)    { person.quests }
    it_behaves_like   "an array endpoint", :get, :quest
  end
end