require 'rails_helper'

RSpec.describe 'Customer' do
  context 'Manage Transfer' do
    before(:each) { Transfer.destroy_all }
    before(:each) { Investment.destroy_all }
    before(:each) { Product.destroy_all }
    before(:each) { Tax.destroy_all }
    before(:each) { Account.destroy_all }
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
    it 'Create Transfer' do
      user = create(:user, :confirmed)
      other_user = create(:user, :confirmed, email: 'other_user@raro.com')
      user.userable.account.update(amount: 125)
      login_as(user, scope: :user)
      visit '/'

      click_link 'Transferências'
      click_link 'Nova Transferência'

      fill_in 'Conta', with: other_user.userable.cpf
      fill_in 'Valor da Transferência', with: '123'
      click_button 'Realizar Transferência'

      expect(page).to have_content(user.userable.cpf)
      expect(page).to have_content(other_user.userable.cpf)
      expect(page).to have_content(123)
    end
    it 'Create Transfer-invalid' do
      user = create(:user, :confirmed)
      other_user = create(:user, :confirmed, email: 'other_user@raro.com')
      login_as(user, scope: :user)
      visit '/'

      click_link 'Transferências'
      click_link 'Nova Transferência'

      fill_in 'Conta', with: other_user.userable.account.id

      click_button 'Realizar Transferência'

      expect(page).not_to have_content(user.userable.cpf)
      expect(page).not_to have_content(other_user.userable.cpf)
      expect(page).not_to have_content(123)
      expect(page).to have_content('Valor da Transferência deve ser maior que 0.0')
    end
  end
end
