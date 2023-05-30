require 'rails_helper'

RSpec.describe ContactList, type: :model do
  it { should belong_to(:customer) }
end
