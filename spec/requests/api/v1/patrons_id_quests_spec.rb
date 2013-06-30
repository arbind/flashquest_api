require "spec_helper"

describe "/patrons/:id/quests", type: :request do
  include_context "activity"
  let (:patron)       { Patron.all.second }
  let (:http_path)    { api_v1_patron_quests_path(patron) }

  context :GET do
    let (:subject)    { patron.quests }
    it_behaves_like   "an array endpoint", :get, :quest
  end
end