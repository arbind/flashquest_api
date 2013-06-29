FactoryGirl.define do
  factory :branch do
    after :create do |branch, ctx|
      [:fb_like, :twitter_follow, :comment, :photo].each do |type|
        create :quest_description,
          type: type,
          name: type.to_s,
          description: "#{type} quest",
          branch: branch
      end
      [10, 20, 30].each do |points|
        create :reward_description,
          points_required: points,
          description: "#{points}% off",
          branch: branch
      end
    end
  end

  trait :with_patrons do
    ignore do
      num_patrons_each 3
    end
    after :create do |branch, ctx|
      if Person.count < ctx.num_patrons_each
        FactoryGirl.create_list :person, (ctx.num_patrons_each - Person.count)
      end
      people = Person.all
      (1..ctx.num_patrons_each).to_a.each do |i|
        people[i-1].patronize(branch)
      end
    end
  end
end