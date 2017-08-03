require 'rails_helper'

RSpec.feature 'Admin makes drink, cereal, soup', type: :feature do

  let!(:admin) {FactoryGirl.create :user} #создаю админа
  let(:user) {FactoryGirl.create :user} #создаю полььзователя

  before(:each) do
    login_as admin #захожу как админ
  end

  scenario 'successfully created soup' do

    visit '/'
    click_link('Первые блюда')
    expect(page).to have_current_path '/soups'

    click_link('Добавить Первое блюдо')
    expect(page).to have_current_path '/soups/new'
    fill_in('Name', :with => 'Супчик')
    fill_in('Price', :with => 855 )

    click_button('Сохранить')
    expect(page).to have_current_path '/soups'
    expect(page).to have_content 'Вы добавили новое Первое блюдо'
    expect(page).to have_content 'Супчик'
  end

  scenario 'successfully created cereal' do

    visit '/'
    click_link('Вторые блюда')
    expect(page).to have_current_path '/cereals'

    click_link('Добавить Второе блюдо')
    expect(page).to have_current_path '/cereals/new'
    fill_in('Name', :with => 'Пюрешка')
    fill_in('Price', :with => 120 )

    click_button('Сохранить')
    expect(page).to have_current_path '/cereals'
    expect(page).to have_content 'Вы добавили новое Второе блюдо'
    expect(page).to have_content 'Пюрешка'
  end

  scenario 'successfully created drink' do

    visit '/'
    click_link('Напитки')
    expect(page).to have_current_path '/drinks'

    click_link('Добавить напиток')
    expect(page).to have_current_path '/drinks/new'
    fill_in('Name', :with => 'Компот')
    fill_in('Price', :with => 99 )

    click_button('Сохранить')
    expect(page).to have_current_path '/drinks'
    expect(page).to have_content 'Вы добавили новый напиток'
    expect(page).to have_content 'Компот'
  end
end
