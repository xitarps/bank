require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:cpf) }
    it { should have_one(:user).class_name('User') }
    it { should have_one(:contact_list).class_name('ContactList') }
  end
end
