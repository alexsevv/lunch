require 'rails_helper'

RSpec.describe User do
  #проверяем, что только первый юзер получит админский доступ
  it "only first user Admin" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)

    expect(user1.admin).to eq true
    expect(user2.admin).to eq false
    expect(user3.admin).to eq false
  end

  #проверяем, что у юзера сгенерился 24-символьный токен
  it "token present" do
    user = FactoryGirl.create(:user)

    expect(user.token.size).to eq 24
  end
end
