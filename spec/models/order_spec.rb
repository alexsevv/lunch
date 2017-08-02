require 'rails_helper'

describe Order do
  #проверяем, что ордер наполняется нужными данными
  it "create order" do
    user = FactoryGirl.create(:user)
    drink = FactoryGirl.create(:drink)
    cereal = FactoryGirl.create(:cereal)
    soup = FactoryGirl.create(:soup)
    order = FactoryGirl.create(:order)

    expect(order.soup.name).to eq soup.name
    expect(order.cereal.name).to eq cereal.name
    expect(order.drink.name).to eq drink.name

    expect(order.user.name).to eq user.name
  end
end
