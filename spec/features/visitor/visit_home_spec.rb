require 'rails_helper'

RSpec.describe 'Visitor' do
  before(:each) { User.destroy_all }
  before(:each) { Customer.destroy_all }
  before(:each) { Root.destroy_all }
  context 'Visit home' do
    it 'View navbar' do
      home_message = 'Quem nunca ficou até depois da hora em alguma aula do Paulo que atire a primeira pedra…'
      visit '/'

      expect(page).to have_content('Login')
      expect(page).to have_content(home_message)
    end
  end
end
