class Product < ApplicationRecord
  belongs_to :tax
  has_many :investments
  has_many :accounts, through: :investments

  validates :name, presence: true
  validates :start_date, presence: true
  validates :final_date, presence: true
  validates :minimum_amount, presence: true
  validates :minimum_amount, numericality: { greater_than_or_equal_to: 1 }
end
