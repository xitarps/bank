class Root < ApplicationRecord
  has_one :user, as: :userable, dependent: :nullify

  accepts_nested_attributes_for :user
end
