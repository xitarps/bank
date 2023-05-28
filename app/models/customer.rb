class Customer < ApplicationRecord
  has_one :user, as: :userable, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cpf, presence: true
end
