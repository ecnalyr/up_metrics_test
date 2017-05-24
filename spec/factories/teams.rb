FactoryGirl.define do
  factory :team do
    sequence :name do |n|
      "team#{n}"
    end
    association :organization
  end
end
