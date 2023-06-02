require 'rails_helper'

RSpec.describe 'Administrator' do
  context 'Product' do
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
    after(:each) { Product.destroy_all }
    it 'Create Product' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:tax)
      visit '/'

      click_on 'Produtos'
      click_on 'Novo produto'

      name = Faker::Commerce.product_name

      fill_in 'Nome do produto',  with: name
      fill_in 'Data de Início',   with: Faker::Date.between(from: Date.today, to: '2024-12-31')
      fill_in 'Data de fim',      with: Faker::Date.between(from: Date.tomorrow, to: '2024-12-31')
      fill_in 'Valor mínimo',     with: Faker::Number.decimal(l_digits: 4, r_digits: 2)
      select nil,                 from: 'Taxa'

      click_on 'Enviar'
      expect(page).to have_content(name)
    end
    it 'Edit Product' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:product)
      visit '/products'

      click_on 'Mostrar'
      click_on 'Editar'

      name2 = Faker::Commerce.product_name

      fill_in 'Nome do produto',  with: name2

      click_on 'Enviar'
      expect(page).to have_content(name2)
    end
    it 'Edit Product invalid' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:product)
      visit '/products'

      click_on 'Mostrar'
      click_on 'Editar'

      fill_in 'Nome do produto',  with: ''

      click_on 'Enviar'
      expect(page).to have_content('Name não pode ficar em branco')
    end
    it 'Destroy Product' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:product)
      visit '/'

      click_on 'Produtos'
      click_on 'Mostrar'
      click_on 'Apagar'
      expect(page).to have_content('Produto apagado!')
    end
    it 'Create Product invalid' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      tax = FactoryBot.create(:tax)
      visit '/'

      click_on 'Produtos'
      click_on 'Novo produto'

      fill_in 'Nome do produto',  with: ''
      fill_in 'Data de Início',   with: Faker::Date.between(from: Date.today, to: '2024-12-31')
      fill_in 'Data de fim',      with: Faker::Date.between(from: Date.tomorrow, to: '2024-12-31')
      fill_in 'Valor mínimo',     with: Faker::Number.decimal(l_digits: 4, r_digits: 2)
      select(value = "#{tax.name}" , from: 'Taxa')

      click_on 'Enviar'
      expect(page).to have_content('Name não pode ficar em branco')
    end
  end
end