FactoryGirl.define do
  factory :team do
    sequence :name do |n|
      "team#{n}"
    end
    association :organization

    trait :with_users do
      transient do
        users_count 2
      end

      after(:create) do |team, evaluator|
        FactoryGirl.create_list(:user, evaluator.users_count, teams: [team])
      end
    end
  end
end
