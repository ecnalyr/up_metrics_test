FactoryGirl.define do
  factory :user do
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    height_inches 1.5
    weight_pounds 1.5
    private_profile false
  end
end
