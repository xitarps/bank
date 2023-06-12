require 'rails_helper'

RSpec.describe 'Customer' do
  context 'Manage Investment' do
    before(:each) { Investment.destroy_all }
    before(:each) { Product.destroy_all }
    before(:each) { Tax.destroy_all }
    before(:each) { Account.destroy_all }
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
    it 'Create Investment' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      product = FactoryBot.create(:product)
      visit '/'

      click_on 'Investimentos'
      click_on 'Novo investimento'

      fill_in 'Saldo a investir',     with: Faker::Number.within(range: product.minimum_amount..10_000)
      select(product.name.to_s, from: 'Produto de investimento')

      click_on 'Confirmar'

      expect(page).to have_content('Investimento criado com sucesso!')
    end
    it 'Create Investment invalid' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      product = FactoryBot.create(:product)
      visit '/'

      click_on 'Investimentos'
      click_on 'Novo investimento'

      fill_in 'Saldo a investir',     with: ''
      select(product.name.to_s, from: 'Produto de investimento')

      click_on 'Confirmar'

      expect(page).to have_content('Saldo não pode ficar em branco')
    end
    it 'Destroy Investment' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)
      product = FactoryBot.create(:product)
      visit '/investments'

      click_on 'Investimentos'
      click_on 'Novo investimento'

      fill_in 'Saldo a investir',     with: Faker::Number.within(range: product.minimum_amount..10_000)
      select(product.name.to_s, from: 'Produto de investimento')

      click_on 'Confirmar'
      click_on 'Detalhes'
      click_on 'Apagar'
      expect(page).to have_content('Investimento apagado com sucesso!')
    end
  end
end
