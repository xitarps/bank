require 'rails_helper'

RSpec.describe 'Customer' do
  context 'Filter' do
    before(:each) { Investment.destroy_all }
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
    before(:each) { Product.destroy_all }
    before(:each) { Tax.destroy_all }
    after(:each) { Investment.destroy_all }
    it 'By Premium' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      produto = FactoryBot.create(:product)
      produto.update(premium: true)
      produto2 = FactoryBot.create(:product)
      produto2.update(premium: false)
      visit '/products'

      select('Premium', from: 'Premium')
      click_on 'Filtrar'

      expect(page).to have_content(produto.name.truncate(20))
      expect(page).to_not have_content(produto2.name.truncate(20))
    end
    it 'By Standard' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      produto = FactoryBot.create(:product)
      produto.update(premium: false)
      produto2 = FactoryBot.create(:product)
      produto2.update(premium: true)
      visit '/products'

      select('Standard', from: 'Premium')
      click_on 'Filtrar'

      expect(page).to have_content(produto.name.truncate(20))
      expect(page).to_not have_content(produto2.name.truncate(20))
    end
    it 'By Standard and premium' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      produto = FactoryBot.create(:product)
      produto.update(premium: false)
      produto2 = FactoryBot.create(:product)
      produto2.update(premium: true)
      visit '/products'

      select('Standard', from: 'Premium')
      select('Premium', from: 'Premium')
      click_on 'Filtrar'

      expect(page).to have_content(produto.name.truncate(20))
      expect(page).to have_content(produto2.name.truncate(20))
    end
    it 'By Index' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      produto = FactoryBot.create(:product)
      visit '/products'

      select(produto.tax.name, from: 'Index')
      click_on 'Filtrar'

      expect(page).to have_content(produto.name.truncate(20))
    end
    it 'By Index2' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      produto = FactoryBot.create(:product)
      tax = FactoryBot.create(:tax)
      produto2 = FactoryBot.create(:product)
      produto2.update(tax:)
      visit '/products'

      select(tax.name, from: 'Index')
      click_on 'Filtrar'

      expect(page).to_not have_content(produto.name.truncate(20))
      expect(page).to have_content(produto2.name.truncate(20))
    end
    it 'By Minimum Amount' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      produto = FactoryBot.create(:product)
      produto2 = FactoryBot.create(:product)
      produto2.update(minimum_amount: 99)
      visit '/products'

      fill_in 'Valor mínimo', with: produto.minimum_amount
      click_on 'Filtrar'

      expect(page).to have_content(produto.name.truncate(20))
      expect(page).to_not have_content(produto2.name.truncate(20))
    end
    it 'By Final Date' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      produto = FactoryBot.create(:product)
      produto2 = FactoryBot.create(:product)
      produto2.update(final_date: '2023/06/10')
      visit '/products'

      fill_in 'Data de validade', with: produto.final_date
      click_on 'Filtrar'

      expect(page).to have_content(produto.name.truncate(20))
      expect(page).to_not have_content(produto2.name.truncate(20))
    end
  end
end
