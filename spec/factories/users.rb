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
end
