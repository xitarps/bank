class Tax < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :value, presence: true
  validates :value, numericality: true
end
