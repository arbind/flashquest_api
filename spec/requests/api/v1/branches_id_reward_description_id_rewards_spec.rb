require 'spec_helper'

describe "/branches/:id/reward_descriptions/:id/rewards", :type => :request do
  include_context 'json response'
  include_context 'current user'
  include_context "activity"

  let!(:num_rewards)        { Reward.count }
  let (:branch)             { Branch.all.second }
  let (:reward_description) { branch.reward_descriptions.first }

  describe ":POST" do
    let (:http_path)      { api_v1_new_reward_path(branch, reward_description) }
    let (:subject)        { nil }
    it_behaves_like 'an item endpoint', :post, :reward

    context do
      before { post http_path, nil, access_token_headers }
      it "creates a new reward" do
        expect(Reward.count).to be num_rewards + 1
      end
    end
  end
end