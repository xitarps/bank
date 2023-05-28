require 'rails_helper'

RSpec.describe Root, type: :model do
  context 'associations' do
    it { should have_one(:user).class_name('User') }
  end
end
