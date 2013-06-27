FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.words 3 }
  end
end
