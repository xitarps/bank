require 'rails_helper'

RSpec.describe 'Administrator', type: :feature do
  before(:each) do
    User.destroy_all
    Customer.destroy_all
    Administrator.destroy_all
    Root.destroy_all
    Tax.destroy_all
    Classroom.destroy_all
  end

  context 'Manage Account' do
    let!(:admin) { create(:user, :confirmed, :administrator) }
    let!(:user) { create(:user, :confirmed) }
    let!(:another_user) { create(:user, :confirmed) }

    before(:each) do
      login_as(admin, scope: :user)
    end

    it 'Visit accounts page' do
      user.userable.account.update(amount: 12.77)
      another_user.userable.account.update(amount: 9.99)
      visit '/'
      click_on 'Contas'

      expect(page).to have_content('12,77')
      expect(page).to have_content('9,99')
    end

    it 'Update accounts amount' do
      user.userable.account.update(amount: 12.77)
      visit "/accounts/#{user.userable.account.id}"
      click_on 'Editar'

      fill_in 'Saldo', with: 33.96
      click_on 'Confirmar'

      expect(page).to have_content('33,96')
    end

    it 'Not be able to update accounts with blank amount' do
      user.userable.account.update(amount: 12.77)
      visit "/accounts/#{user.userable.account.id}"
      click_on 'Editar'

      fill_in 'Saldo', with: ''
      click_on 'Confirmar'

      expect(page).to have_content('Saldo não pode ficar em branco')
    end
  end
end
