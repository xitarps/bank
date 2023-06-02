class Tax < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, presence: true
  validates :value, presence: true
  validates :value, numericality: true
end
