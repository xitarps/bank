class ContactList < ApplicationRecord
  belongs_to :customer
  has_many :customer_contact_lists, dependent: :destroy
  has_many :customers, through: :customer_contact_lists
end
