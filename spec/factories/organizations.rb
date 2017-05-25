FactoryGirl.define do
  factory :organization do
    sequence :name do |n|
      "organization#{n}"
    end

    trait :with_teams do
      transient do
        teams_count 2
      end

      after(:create) do |organization, evaluator|
        FactoryGirl.create_list(:team, evaluator.teams_count, organization: organization)
      end
    end

    trait :with_busy_teams do
      transient do
        teams_count 2
      end

      after(:create) do |organization, evaluator|
        FactoryGirl.create_list(:team, evaluator.teams_count, :with_busy_users, organization: organization)
      end
    end
  end
end
