FactoryGirl.define do
  factory :user do
    name "Alex"
    password "password"
    sequence(:email) { |n| "someguy_#{n}@example.com" }
  end
end
