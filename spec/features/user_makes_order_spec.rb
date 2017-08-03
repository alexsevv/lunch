require 'rails_helper'

RSpec.feature 'USER makes order', type: :feature do

  let!(:admin) {FactoryGirl.create :user}
  let(:user) {FactoryGirl.create :user}

  let!(:soup) {FactoryGirl.create :soup}
  let!(:cereal) {FactoryGirl.create :cereal}
  let!(:drink) {FactoryGirl.create :drink}

  before(:each) do
    login_as user
  end

  scenario 'successfully created order' do
    #заходим на главную
    visit '/'

    #так как радиокнопки уже нажаты по умолчанию по одному из блюд группы,
    # можно просто нажать на Создать заказ
    click_button('Создать Заказ')

    #ожидаем попасть на главную
    expect(page).to have_current_path '/'

    #ожидаем, что на экране появится надпись
    expect(page).to have_content 'Ваш заказ отправлен на обработку'
  end
end
