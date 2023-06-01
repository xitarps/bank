require 'rails_helper'

RSpec.describe Administrator, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_one(:user).class_name('User') }
end
