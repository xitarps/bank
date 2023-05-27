class Customer < ApplicationRecord
  has_one :user, as: :userable
end
