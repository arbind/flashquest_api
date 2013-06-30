require "spec_helper"

describe "/people/:id/rewards", type: :request do
  include_context "activity"
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_rewards_path(person) }

  context :GET do
    let (:subject)    { person.rewards }
    it_behaves_like   "an array endpoint", :get, :reward
  end
end