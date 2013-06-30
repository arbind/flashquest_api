require "spec_helper"

describe "/businesses", type: :request do
  let!(:businesses)   { create_list :business, 3 }
  let (:http_path)  { api_v1_businesses_path }

  context :GET do
    let (:subject)  { businesses }
    it_behaves_like "an array endpoint", :get, :business
  end

  describe "/:id" do
    let (:http_path)  { api_v1_business_path(subject) }

    context :GET do
      let (:subject)  { Business.all.second }
      it_behaves_like "an item endpoint", :get, :business
    end
  end
end