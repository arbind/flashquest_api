require "spec_helper"

describe "/patrons/:id/rewards", type: :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"
  let (:patron)       { Patron.all.second }
  let (:http_path)    { api_v1_patron_rewards_path(patron) }

  context :GET do
    let (:subject)    { patron.rewards }
    it_behaves_like   "an array endpoint", :get, :reward
  end
end