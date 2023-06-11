require 'rails_helper'

RSpec.describe 'Administrator' do
  context 'Account' do
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
  end
end
