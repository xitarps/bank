require 'rails_helper'

RSpec.describe Investment, type: :model do
  it { should validate_presence_of(:amount) }
  it { should validate_numericality_of(:amount) }
end
