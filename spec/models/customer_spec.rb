require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:cpf) }
    it { should have_one(:user).class_name('User') }
    it { should have_one(:contact_list).class_name('ContactList') }
  end
  describe '#full_name' do
    it 'returns the full name with initial' do
      customer = Customer.new(first_name: 'Jadson', last_name: 'Rubens')
      expect(customer.full_name).to eq('R. Jadson')
    end
  end
end
