require 'rails_helper'

RSpec.describe 'Visitor' do
  before(:each) { User.destroy_all }
  before(:each) { Customer.destroy_all }
  before(:each) { Root.destroy_all }
  context 'Visit home' do
    it 'View navbar' do
      visit '/'

      expect(page).to have_content('Login')
      expect(page).to have_content('Home')
    end
  end
end
