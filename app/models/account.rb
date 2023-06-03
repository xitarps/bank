class Account < ApplicationRecord
  belongs_to :customer
  has_many :investment

  validates :amount, presence: true
end
