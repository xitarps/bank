class Investment < ApplicationRecord
  belongs_to :account
  belongs_to :product

  validates :amount, presence: true
  validates :amount, numericality: true
end
