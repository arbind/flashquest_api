module ActivityHelpers
  shared_context 'activity' do
    let!(:my_activity) {
      business = Business.first_or_create
      branch = business.branches.first_or_create
      patron = me.patronize branch
      quest_description = branch.quest_descriptions.first
      quest_description ||= branch.quest_descriptions.create
      quest = patron.start_quest quest_description
      comment = Comment.create quest: quest, person: me
      comment = Comment.create quest: quest, person: me
      me.activities
    }
    let!(:other_activity) {
      activities = []
      (0..2).to_a.each do |i|
        other_person = Person.ne(id: me.id).first_or_create
        business = Business.first_or_create
        branch = business.branches.first_or_create
        quest_description = branch.quest_descriptions.first
        quest_description ||= branch.quest_descriptions.create
        other_patron = other_person.patronize branch
        other_quest = other_patron.start_quest quest_description
        comment = Comment.create quest: other_quest, person: other_person
        comment = Comment.create quest: other_quest, person: other_person
        activities.concat other_person.activities
      end
      activities
    }
  end
end
