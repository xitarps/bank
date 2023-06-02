class Product < ApplicationRecord
  belongs_to :tax

  validates :name, presence: true
  validates :start_date, presence: true
  validates :final_date, presence: true
  validates :minimum_amount, presence: true
  validates :minimum_amount, numericality: { greater_than_or_equal_to: 1  }
  validates :tax_id, presence: true 

end
