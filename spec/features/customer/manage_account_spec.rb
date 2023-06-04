require 'rails_helper'

RSpec.describe 'Customer', type: :feature do
  before(:each) do
    User.destroy_all
    Customer.destroy_all
    Administrator.destroy_all
    Root.destroy_all
    Tax.destroy_all
    Classroom.destroy_all
  end

  context 'Manage Account' do
    let(:user) { create(:user, :confirmed) }
    let(:other_user) { create(:user, :confirmed) }

    before(:each) do
      login_as(user, scope: :user)
    end

    it 'Visit it\'s account page' do
      Account.first.update(amount: 12.77)
      visit '/'
      click_on 'Conta'

      expect(page).to have_content('12,77')
    end

    it 'Not be able visit other\'s account page' do
      user.userable.account.update(amount: 3.14)
      other_user.userable.account.update(amount: 6.28)

      visit "/accounts/#{other_user.userable.account.id}"

      expect(page).to have_content('3,14')
      expect(page).not_to have_content('6,28')
    end
  end
end
