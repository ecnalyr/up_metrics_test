FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "example#{n}@example.com"
    end
    first_name 'MyString'
    last_name 'MyString'
    height_inches 1.5
    weight_pounds 1.5
    private_profile false
  end

  trait :with_sports_interests do
    transient do
      sports_interests_count 2
    end

    after(:create) do |user, evaluator|
      FactoryGirl.create_list(:sports_interest, evaluator.sports_interests_count, user: user)
    end
  end

  trait :with_public_profile do
    first_name 'John'
    last_name 'Doe'
    height_inches 72
    weight_pounds 185
    private_profile false
  end

  trait :with_private_profile do
    first_name 'Jane'
    last_name 'Doe'
    height_inches 60
    weight_pounds 150
    private_profile true
  end

  trait :with_teams do
    transient do
      teams_count 2
    end

    after(:create) do |user, evaluator|
      FactoryGirl.create_list(:team, evaluator.teams_count, users: [user])
    end
  end

  trait :with_recent_participation do
    # Within the last week
    after(:create) do |user, evaluator|
      FactoryGirl.create(:participation, :with_duration, user: user, date: 1.day.ago)
    end
  end

  trait :with_old_participation do
    # Prior to 1 week ago
    after(:create) do |user, evaluator|
      FactoryGirl.create(:participation, :with_duration, user: user, date: 1.month.ago)
    end
  end
end
