require 'rails_helper'

RSpec.describe 'ContactList' do
  before(:each) { User.destroy_all }
  before(:each) { Customer.destroy_all }
  before(:each) { Root.destroy_all }
  context 'DELETE' do
    let(:other_user) { create(:user, email: 'other@gmail.com') }
    let(:another_user) { create(:user, email: 'another@gmail.com') }
    it 'remove customer' do
      user = create(:user, :confirmed)
      login_as(user, scope: :user)

      user.userable.contact_list.customers << other_user.userable
      user.userable.contact_list.customers << another_user.userable

      delete "/contact_lists/#{user.userable.contact_list.id}/customers/#{other_user.userable.id}"

      expect(user.userable.contact_list.customers.size).to eq(1)
      expect(user.userable.contact_list.customers).not_to include(other_user.userable)
      expect(user.userable.contact_list.customers).to include(another_user.userable)
    end
  end
end
