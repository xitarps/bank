require 'rails_helper'

RSpec.describe 'Account' do
  before(:each) { User.destroy_all }
  before(:each) { Customer.destroy_all }
  before(:each) { Root.destroy_all }
  context 'DELETE' do
    let(:user) { create(:user, email: 'user@gmail.com') }
    let(:another_user) { create(:user, email: 'another_user@gmail.com') }
    # TODO: Soft Delete to come...
    xit 'remove/disable account' do
      admin = create(:user, :confirmed, :administrator)
      login_as(admin, scope: :user)
      user.userable.account.update(amount: 3.14)
      another_user.userable.account.update(amount: 6.28)

      delete "/accounts/#{user.userable.account.id}"

      expect(Account.count).to eq(2)
    end
  end
end
