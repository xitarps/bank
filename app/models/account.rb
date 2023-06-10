class Account < ApplicationRecord
  belongs_to :customer
  has_many :investments, dependent: :nullify
  has_many :products, through: :investments

  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }


  has_many :transfers_as_sender, foreign_key: :sender_id, class_name: 'Transfer',
                                 dependent: :destroy, inverse_of: :sender
  has_many :accounts_sent, through: :transfers_as_sender, source: :receiver
  has_many :transfers_as_receiver, foreign_key: :receiver_id, class_name: 'Transfer',
                                   dependent: :destroy, inverse_of: :receiver
  has_many :accounts_received, through: :transfers_as_receiver, source: :sender

  scope :by_customer_id, ->(customer_id) { where(customer_id: customer_id) }
  scope :by_classroom_id, ->(classroom_id) { joins(customer: :customer_classes).where('customer_classes.classroom_id = ?', classroom_id) }

  def transfers
    Transfer.where(sender: self).or(Transfer.where(receiver: self))
  end

  def self.deposit(accounts, value)
    accounts.reload
    ActiveRecord::Base.transaction do
      accounts.each{ |account| account.update!(amount: account.amount + value) }
    end
    rescue
      accounts
  end
end
