require 'rails_helper'

RSpec.feature 'Admin views users', type: :feature do

  let!(:admin) {FactoryGirl.create :user} #создаю админа

  before(:each) do
    login_as admin #захожу как админ
  end

  scenario 'successfully created order' do

    user1 = FactoryGirl.create(:user, name: 'Alex')
    user2 = FactoryGirl.create(:user, name: 'Sasha')
    user3 = FactoryGirl.create(:user, name: 'Masha')

    visit '/'
    click_link('Пользователи')
    expect(page).to have_current_path '/users'

    #ожидаем, что на экране появится надпись
    expect(page).to have_content 'Alex'
    expect(page).to have_content 'Sasha'
    expect(page).to have_content 'Masha'
  end
end
