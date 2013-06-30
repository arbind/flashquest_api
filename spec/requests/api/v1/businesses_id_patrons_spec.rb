require "spec_helper"

describe "/businesses/:id/patrons", type: :request do
  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:business)     { businesses.second }
  let (:http_path)    { api_v1_business_patrons_path(business) }

  context :GET do
    let (:subject)  { business.patrons }
    it_behaves_like "an array endpoint", :get, :patron
  end
end