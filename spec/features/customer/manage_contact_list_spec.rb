require 'rails_helper'

RSpec.describe 'Customer' do
  before(:each) { User.destroy_all }
  before(:each) { Customer.destroy_all }
  before(:each) { Root.destroy_all }
  context 'Manage Contact list' do
    let(:other_user) { create(:user, email: 'other@gmail.com') }
    let(:another_user) { create(:user, email: 'another@gmail.com') }
    it 'add customers to contact list' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)

      user.userable.contact_list.customers << other_user.userable
      user.userable.contact_list.customers << another_user.userable

      visit '/'
      click_on 'Lista de contatos'

      expect(page).to have_content(other_user.userable.first_name.truncate(10))
      expect(page).to have_content(another_user.userable.first_name.truncate(10))
    end
    # In order to run next test, change folder name to system intead of features or enable js on describe and remove 'x'
    xit 'remove customer from contact list' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)

      user.userable.contact_list.customers << other_user.userable
      user.userable.contact_list.customers << another_user.userable

      visit '/'
      click_on 'Lista de contatos'

      accept_confirm do
        all(:css, "a.destroy-button[data-turbo-method='delete']").first.click
      end

      expect(page).not_to have_content(other_user.userable.first_name.truncate(10))
      expect(page).to have_content(another_user.userable.first_name.truncate(10))
    end
  end
end
