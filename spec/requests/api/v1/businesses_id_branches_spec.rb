require "spec_helper"

describe "/businesses/:id/branches", type: :request do
  let!(:businesses)   { create_list :business, 3, :with_branches }
  let (:business)     { Business.all.second }
  let (:http_path)    { api_v1_business_branches_path(business) }

  context :GET do
    let (:subject)    { business.branches }
    it_behaves_like   "an array endpoint", :get, :branch
 end
end