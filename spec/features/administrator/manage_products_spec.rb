require 'rails_helper'

RSpec.describe 'Administrator' do
  context 'Manage Product' do
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
    before(:each) { Product.destroy_all }
    before(:each) { Tax.destroy_all }
    it 'Create Product' do
      user = create(:user, :confirmed, :administrator)
      login_as(user, scope: :user)
      name = Faker::Commerce.product_name
      tax = FactoryBot.create(:tax)
      visit '/'

      click_on 'Produtos'
      click_on 'Novo produto'

      fill_in 'Nome do produto',  with: name
      fill_in 'Data de início',   with: Faker::Date.between(from: Time.zone.today, to: '2024-12-31')
      fill_in 'Data de fim',      with: Faker::Date.between(from: Date.tomorrow, to: '2024-12-31')
      fill_in 'Valor mínimo',     with: Faker::Number.decimal(l_digits: 4, r_digits: 2)
      select(tax.name.to_s, from: 'Taxa')

      click_on 'Confirmar'
      expect(page).to have_content(name.truncate(20))
    end
    it 'Edit Product' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:product)
      visit '/products'

      click_on 'Detalhes'
      click_on 'Editar'

      name2 = Faker::Commerce.product_name

      fill_in 'Nome do produto', with: name2

      click_on 'Confirmar'
      expect(page).to have_content(name2.truncate(20))
    end
    it 'Edit Product invalid' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:product)
      visit '/products'

      click_on 'Detalhes'
      click_on 'Editar'

      fill_in 'Nome do produto', with: ''

      click_on 'Confirmar'
      expect(page).to have_content('Nome não pode ficar em branco')
    end
    it 'Destroy Product' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:product)
      visit '/'

      click_on 'Produtos'
      click_on 'Detalhes'
      click_on 'Apagar'
      expect(page).to have_content('Apagado com sucesso!')
    end
    it 'Create Product invalid' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      tax = FactoryBot.create(:tax)
      visit '/'

      click_on 'Produtos'
      click_on 'Novo produto'

      fill_in 'Nome do produto',  with: ''
      fill_in 'Data de início',   with: Faker::Date.between(from: Time.zone.today, to: '2024-12-31')
      fill_in 'Data de fim',      with: Faker::Date.between(from: Date.tomorrow, to: '2024-12-31')
      fill_in 'Valor mínimo',     with: Faker::Number.decimal(l_digits: 4, r_digits: 2)
      select(tax.name.to_s, from: 'Taxa')

      click_on 'Confirmar'
      expect(page).to have_content('Nome não pode ficar em branco')
    end
  end
end
