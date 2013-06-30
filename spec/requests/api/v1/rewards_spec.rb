require "spec_helper"

describe "/rewards", type: :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"
  let (:http_path)    { api_v1_rewards_path }

  context :GET do
    let (:subject)    { Reward.all }
    it_behaves_like   "an array endpoint", :get, :reward
  end

  describe "/:id" do
    let (:http_path)  { api_v1_reward_path(subject) }

    context :GET do
      let (:subject)  { Reward.all.second }
      it_behaves_like "an item endpoint", :get, :reward
    end
  end
end