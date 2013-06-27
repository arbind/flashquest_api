FactoryGirl.define do
  sequence(:url) { |n| "http://here.com/place-#{n}" }
end