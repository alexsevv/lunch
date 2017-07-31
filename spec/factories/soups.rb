FactoryGirl.define do
  factory :soup do
    association :user

    name "Суп грибной"
    price 45
  end
end
