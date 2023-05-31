class CustomerContactList < ApplicationRecord
  belongs_to :contact_list
  belongs_to :customer
end
