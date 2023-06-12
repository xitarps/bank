class Tax < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :value, presence: true
  validates :value, numericality: true
end
