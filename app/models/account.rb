class Account < ApplicationRecord
  belongs_to :customer
  validates :amount, presence: true
end
