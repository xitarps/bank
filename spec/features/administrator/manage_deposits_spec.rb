require 'rails_helper'

RSpec.describe 'Deposits' do
  describe 'New Deposit Form' do
    # let(:user) { create(:user, :confirmed, :administrator) }
    # let(:administrator) { create(:administrator) }

    before(:each) do
      # login_as(user, scope: :user)
    end
    xit 'creates a deposit for customer' do
      customer = FactoryBot.create(:customer)
      visit '/deposits/new#'

      select(customer.first_name, from: 'customer_id')
      find('#customer_form').fill_in('Valor', with: 10.0)
      find('#customer_form').click_button 'Depositar'

      expect(page).to have_text('Depósito criado com sucesso')
      puts 'Teste: creates a deposit for customer - PASSED'
    end

    xit 'creates a deposit for classroom' do
      FactoryBot.create(:classroom)
      classroom_name = Classroom.first.name
      customer = FactoryBot.create(:customer)
      Classroom.first.customers << customer
      visit new_deposit_path

      select classroom_name, from: 'classroom_id'
      find('#classroom_form').fill_in('Valor', with: 200.0)
      find('#classroom_form').click_button 'Depositar'
      expect(page).to have_text('Depósito criado com sucesso')
      puts 'Teste: creates a deposit for classroom - PASSED'
      Classroom.destroy_all
      Customer.destroy_all
      CustomerClass.destroy_all
    end

    xit 'displays validation error when customer is not selected' do
      visit new_deposit_path
      find('#customer_form').fill_in('Valor', with: 100.0)
      find('#customer_form').click_button 'Depositar'

      expect(page).to have_text('Cliente(s) não pode ficar em branco')
      puts 'Teste: displays validation error when customer is not selected - PASSED'
    end

    xit 'displays validation error when classroom is not selected' do
      visit new_deposit_path
      find('#classroom_form').fill_in('Valor', with: 200.0)
      find('#classroom_form').click_button 'Depositar'

      expect(page).to have_text('Cliente(s) não pode ficar em branco')
      puts 'Teste: displays validation error when classroom is not selected - PASSED'
    end
  end
end
