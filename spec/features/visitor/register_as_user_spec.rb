require 'rails_helper'

RSpec.describe 'Visitor' do
  before(:each) do
    User.destroy_all
    Account.destroy_all
    Customer.destroy_all
    Administrator.destroy_all
    Root.destroy_all
    Tax.destroy_all
    Classroom.destroy_all
  end
  context 'Registration' do
    it 'Register as customer with confirmation' do
      visit '/'

      click_on 'Login'
      click_on 'Sign up'

      fill_in 'First name',	with: 'Jadson'
      fill_in 'Last name',	with: 'Dev'
      fill_in 'Cpf',	with: Faker::IDNumber.brazilian_citizen_number
      fill_in 'Email',	with: 'jadson@gmail.com'
      fill_in 'Senha',	with: '123456'
      fill_in 'Password confirmation',	with: '123456'
      click_on 'Registrar'
      sleep 2

      visit "/users/confirmation?confirmation_token=#{User.first.confirmation_token}"
      visit '/users/sign_in'

      fill_in 'email',	with: 'jadson@gmail.com'
      fill_in 'password',	with: '123456'

      click_on 'Log in'

      expect(page).to have_content('Logout')
    end
  end
end
