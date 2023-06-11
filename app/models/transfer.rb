class Transfer < ApplicationRecord
  belongs_to :sender, class_name: 'Account', inverse_of: :transfers_as_sender
  belongs_to :receiver, class_name: 'Account', inverse_of: :transfers_as_receiver

  validates :amount, numericality: { greater_than: 0.0 }
  validate :validate_sender_balance

  enum status: { pending: 5, error: 10, done: 15 }

  def validate_sender_balance
    enough_sender_amount = sender.present? && sender.amount < amount
    errors.add(:base, I18n.t('.insuficient_amount')) if enough_sender_amount
  end
end
