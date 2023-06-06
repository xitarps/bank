class Account < ApplicationRecord
  belongs_to :customer
  has_many :investments, dependent: :nullify
  has_many :products, through: :investments

  validates :amount, presence: true
end
