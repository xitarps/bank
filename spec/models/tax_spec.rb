require 'rails_helper'

RSpec.describe Tax, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
end
