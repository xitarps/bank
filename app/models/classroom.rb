class Classroom < ApplicationRecord
  validates :name, :course, presence: true

  has_many :customer_classes, dependent: :nullify 
  has_many :customers, through: :customer_classes
end
