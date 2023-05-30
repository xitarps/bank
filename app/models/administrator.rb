class Administrator < ApplicationRecord
    has_one :user, as: :userable, dependent: :nullify
    validates :name, presence: true
end
