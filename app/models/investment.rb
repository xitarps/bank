class Investment < ApplicationRecord
  has_one :account
  has_one :product
end
