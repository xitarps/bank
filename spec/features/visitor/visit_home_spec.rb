require 'rails_helper'

RSpec.describe 'Visitor' do
  context 'Visit home' do
    it 'View nav bar' do
      visit '/'

      expect(page).to have_content('Login')
      expect(page).to have_content('Home')
    end
  end
end
