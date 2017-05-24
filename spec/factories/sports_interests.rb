FactoryGirl.define do
  factory :sports_interest do
    association :user
    association :sport
  end
end
