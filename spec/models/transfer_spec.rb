require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'associations' do
    it { should belong_to(:sender).class_name('Account').inverse_of(:transfers_as_sender) }
    it { should belong_to(:receiver).class_name('Account').inverse_of(:transfers_as_receiver) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 5, error: 10, done: 15) }
  end

  describe '#validate_sender_balance' do
    it 'adiciona um erro à base' do
      sender = Account.create(amount: 100.0)
      receiver = Account.create(amount: 0.0)

      transferencia = Transfer.new(sender:, receiver:, amount: 150.0)
      transferencia.valid?

      expect(transferencia.errors[:base]).to include(I18n.t('.insuficient_amount'))
    end
  end
end
