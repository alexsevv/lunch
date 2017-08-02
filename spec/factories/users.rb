FactoryGirl.define do
  factory :user do
    name "Alex"
    #password "password"
    sequence(:email) { |n| "someguy_#{n}@example.com" }
    after(:build) { |u| u.password_confirmation = u.password = "123456" }
  end
end
