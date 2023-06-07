class Account < ApplicationRecord
  belongs_to :customer
  has_many :investments, dependent: :nullify
  has_many :products, through: :investments

  validates :amount, presence: true

  has_many :transfers_as_sender, foreign_key: :sender_id, class_name: 'Transfer',
                                 dependent: :destroy, inverse_of: :sender
  has_many :accounts_sent, through: :transfers_as_sender, source: :receiver
  has_many :transfers_as_receiver, foreign_key: :receiver_id, class_name: 'Transfer',
                                   dependent: :destroy, inverse_of: :receiver
  has_many :accounts_received, through: :transfers_as_receiver, source: :sender

  def transfers
    Transfer.where(sender: self).or(Transfer.where(receiver: self))
  end
end
