require "spec_helper"

describe "/people", type: :request do
  let!(:people)       { create_list :person, 3 }
  let (:http_path)    { api_v1_people_path }

  context :GET do
    let (:subject)    { Person.all }
    it_behaves_like   "an array endpoint", :get, :person
  end

  describe "/:id" do
    let (:http_path)  { api_v1_person_path(subject) }

    context :GET do
      let (:subject)  { Person.all.second }
      it_behaves_like "an item endpoint", :get, :person
    end
  end
end