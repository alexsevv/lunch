FactoryGirl.define do
  factory :drink do
    association :user

    name "Компот"
    price 44
  end
end
