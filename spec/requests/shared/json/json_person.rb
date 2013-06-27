module JsonPerson
  shared_examples_for 'a json person' do
    it 'returns the person path' do
      expect(json_data['person_path']).to eq api_v1_person_path(a_person)
    end
  end
end