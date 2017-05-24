FactoryGirl.define do
  factory :organization do
    sequence :name do |n|
      "organization#{n}"
    end
  end
end
