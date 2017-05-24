FactoryGirl.define do
  factory :participation do
    association :user
    association :sport
  end
end
