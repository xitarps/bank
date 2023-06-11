class Transfer < ApplicationRecord
  belongs_to :sender, class_name: 'Account', inverse_of: :transfers_as_sender
  belongs_to :receiver, class_name: 'Account', inverse_of: :transfers_as_receiver
  validates :amount, numericality: { greater_than: 0.0 }

  enum status: { pending: 5, error: 10, done: 15 }
end
