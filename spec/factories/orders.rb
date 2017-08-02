FactoryGirl.define do
  factory :order do
    association :user
    association :soup
    association :cereal
    association :drink
  end
end
