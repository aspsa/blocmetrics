FactoryGirl.define do
  factory :registered_application do
    name 'my app'
    sequence(:url) { |n| "https://www.example#{n}.com" }
    user
  end
end