module JsonItem
  shared_examples_for "a json item for" do |name|
    it "responds with 200" do
      expect(response.status).to be 200
    end

    it 'returns the items path' do
      expect(json_data["#{name}_path"]).to eq send( :"api_v1_#{name}_path", subject)
    end
  end

  shared_examples_for 'a json list for' do |name|
    it "responds with 200" do
      expect(response.status).to be 200
    end
    it "returns an array" do
      expect(json_data).to be_an Array
    end
    it "returns a list of specific items" do
      expect(json_data).to have_at_least(1).items
      json_data.each do |json_item|
        expect(json_item["#{name}_path"]).to be_present
      end
    end
  end
end