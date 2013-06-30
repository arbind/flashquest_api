module ActivityHelpers
  shared_context 'activity' do
    let!(:my_activity) {
      business = Business.first_or_create
      branch = business.branches.first_or_create
      patron = me.patronize branch
      quest_description = branch.quest_descriptions.first
      quest_description ||= branch.quest_descriptions.create type: :comment, points: 50
      quest = patron.start_quest quest_description
      quest_description = branch.quest_descriptions.create type: :photo, points: 50
      quest = patron.start_quest quest_description
      reward_description = branch.reward_descriptions.first
      reward_description ||= branch.reward_descriptions.create points_required: 20
      reward = patron.redeem_reward reward_description
      comment = Comment.create quest: quest, person: me
      comment = Comment.create quest: quest, person: me
      me.activities
    }
    let!(:other_activity) {
      activities = []
      [Person.create, Person.create].each do |other_person|
        [Business.first_or_create, Business.create].each do |business|
          business.branches.first_or_create
          business.branches.create
          [business.branches.first, business.branches.last].each do |branch|
            (0..2).to_a.each do |i|
              other_patron = other_person.patronize branch
              quest_description = branch.quest_descriptions.first
              quest_description ||= branch.quest_descriptions.create type: :comment, points: 50
              other_quest = other_patron.start_quest quest_description
              reward_description = branch.reward_descriptions.first
              reward_description ||= branch.reward_descriptions.create points_required: 20
              reward = other_patron.redeem_reward reward_description
              comment = Comment.create quest: other_quest, person: other_person
              comment = Comment.create quest: other_quest, person: other_person
              activities.concat other_person.activities
            end
          end
        end
      end
      activities
    }
  end
end
