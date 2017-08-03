require 'rails_helper'

RSpec.feature 'Admin makes order and views orders', type: :feature do

  let!(:admin) {FactoryGirl.create :user} #создаю админа
  let(:user) {FactoryGirl.create :user} #создаю полььзователя

  let!(:soup) {FactoryGirl.create :soup}
  let!(:cereal) {FactoryGirl.create :cereal}
  let!(:drink) {FactoryGirl.create :drink}

  before(:each) do
    login_as admin #захожу как админ
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

  scenario 'views orders' do

    visit '/'
    click_button('Создать Заказ')

    click_link('Заказы')
    expect(page).to have_current_path '/orders'

    #ожидаю увидеть созданый ранее заказ, посмотрю на его сумму
    #общая сумма всех блюд, созданных в фабрике = 247
    expect(page).to have_content '247'
  end
end
