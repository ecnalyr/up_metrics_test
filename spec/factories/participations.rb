FactoryGirl.define do
  factory :participation do
    association :user
    association :sport

    trait :with_duration do
      duration_minutes 10
    end
  end
end
