FactoryGirl.define do
  factory :business do
  end

  trait :with_branches do
    ignore do
      num_branches 2
      num_patrons_each 3
    end
    after :create do |business, ctx|
      create_list :branch, ctx.num_branches, :business => business
    end
  end

  trait :with_branches_and_patrons do
    ignore do
      num_branches 2
      num_patrons_each 3
    end
    after :create do |business, ctx|
      create_list :branch, ctx.num_branches, :with_patrons, num_patrons_each: ctx.num_patrons_each, :business => business
    end
  end

end