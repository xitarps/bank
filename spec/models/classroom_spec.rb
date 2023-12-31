require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:course) }
end
