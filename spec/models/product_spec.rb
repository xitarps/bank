require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:final_date) }
  it { should validate_presence_of(:minimum_amount) }
  it { should validate_presence_of(:tax_id) }
end
