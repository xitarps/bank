require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should belong_to(:customer) }
  it { should validate_presence_of(:amount) }
end
