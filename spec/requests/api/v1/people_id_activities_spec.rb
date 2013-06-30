require "spec_helper"

describe "/people/:id/activities", type: :request do
  include_context "activity"
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_activities_path(person) }

  context :GET do
    let (:subject)    { person.activities }
    it_behaves_like   "an array endpoint", :get, :activity
  end
end