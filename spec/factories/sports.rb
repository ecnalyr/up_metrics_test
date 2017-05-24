FactoryGirl.define do
  factory :sport do
    sequence :name do |n|
      "sport#{n}"
    end
    icon 'icon_url'
  end
end
