FactoryGirl.define do
  factory :cereal do
    association :user

    name "Картошка с мясом"
    price 158
  end
end
