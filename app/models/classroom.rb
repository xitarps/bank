class Classroom < ApplicationRecord
  validates :name, :course, presence: true
end
