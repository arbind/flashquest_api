require "spec_helper"

describe "/patrons", type: :request do
  let!(:branch)       { create_list :branch, 2, :with_patrons }
  let (:http_path)    { api_v1_patrons_path }

  context :GET do
    let (:subject)    { Patron.all }
    it_behaves_like   "an array endpoint", :get, :patron
  end

  describe "/:id" do
    let (:http_path)  { api_v1_patron_path(subject) }

    context :GET do
      let (:subject)  { Patron.all.second }
      it_behaves_like "an item endpoint", :get, :patron
    end
  end
end