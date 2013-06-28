module JsonPerson
  shared_examples_for 'a json person' do
    it "responds with 200" do
      expect(response.status).to be 200
    end

    it 'returns the person path' do
      expect(json_data['person_path']).to eq api_v1_person_path(a_person)
    end
  end

  shared_examples_for 'a json list of people' do

    it "responds with 200" do
      expect(response.status).to be 200
    end

    it "returns an array" do
      expect(json_data).to be_an Array
    end

    it "returns a list of people and the current user" do
      expect(json_data.length).to eq 1+people.length
      people_paths = people.map{|p| api_v1_person_path(p)}
      people_paths.push api_v1_person_path(current_person)
      json_data.each do |json_person|
        expect(people_paths).to include json_person["person_path"]
      end
    end
  end
end