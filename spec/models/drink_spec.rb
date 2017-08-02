require 'rails_helper'

describe Drink do
  #проверяем выборку блюд для разных дней
  it "select drinks on date" do
    drink1 = FactoryGirl.create(:drink)
    drink2 = FactoryGirl.create(:drink, created_at: Date.today-2)

    expect(Drink.created(0)).to include(drink1)
    expect(Drink.created(2)).to include(drink2)
  end
end
