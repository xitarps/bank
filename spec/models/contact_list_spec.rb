require 'rails_helper'

RSpec.describe ContactList, type: :model do
  before(:each) { User.destroy_all }
  before(:each) { Customer.destroy_all }
  before(:each) { Root.destroy_all }
  let(:customer) { create(:customer) }
  let(:other_customer) { create(:customer) }
  let(:another_customer) { create(:customer) }
  it { should belong_to(:customer) }
  context 'Customer' do
    it 'be able to add a new contact(another customer)' do
      customer.contact_list.customers << other_customer
      customer.contact_list.customers << another_customer

      expect(customer.contact_list.customers).to include(other_customer)
      expect(customer.contact_list.customers).to include(another_customer)
      expect(customer.contact_list.customers.size).to eq(2)
    end
  end
end
