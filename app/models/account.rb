class Account < ApplicationRecord
  belongs_to :customer
  has_many :investments
  has_many :products, through: :investments

  validates :amount, presence: true
end
