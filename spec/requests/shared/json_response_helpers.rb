module JsonResponseHelpers
  shared_context 'json response' do
    let (:json)       { JSON.parse response.body }
    let (:json_meta)  { json['meta']}
    let (:json_data)  { json['data']}
    let (:json_errors) { json['errors'] }
  end

  shared_examples_for "a json item" do |name|
    it "responds with 20x" do
      expect(response.status).to be_within(100).of 200
    end

    it "returns the item id" do
      expect(json_data["id"]).to be_present
      if subject
        expect(json_data["id"]).to eq subject.id.to_s
      end
    end
  end

  shared_examples_for 'a json list' do |name|
    it "responds with 20x" do
      expect(response.status).to be_within(100).of 200
    end
    it "returns an array" do
      expect(json_data).to be_an Array
    end
    it "has the right number of items" do
      expect(json_data.length).to eq subject.length
    end
    it "returns a list of specific items" do
      expect(json_data).to have_at_least(1).items
      json_data.each do |json_item|
        expect(json_item["id"]).to be_present
      end
    end
  end
end
