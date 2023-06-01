require 'rails_helper'

RSpec.describe CustomerContactList, type: :model do
  it { should belong_to(:contact_list) }
  it { should belong_to(:customer) }
end
