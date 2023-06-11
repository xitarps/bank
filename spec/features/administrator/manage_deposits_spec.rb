require 'rails_helper'

RSpec.describe 'Deposits', type: :system do
  describe 'New Deposit Form' do
    it 'creates a deposit for customer' do
      visit new_deposit_path

      select(Customer.first.first_name, from: 'customer_id')
      fill_in 'amount', with: 10.0
      click_button 'Depositar'

      expect(page).to have_text('Depósito criado com sucesso')
      puts 'Teste: creates a deposit for customer - PASSED'
    end

    it 'creates a deposit for classroom' do
      visit new_deposit_path

      select Classroom.first.name, from: 'classroom_id'
      fill_in 'amount', with: 200.0
      click_button 'Depositar'

      expect(page).to have_text('Depósito criado com sucesso')
      puts 'Teste: creates a deposit for classroom - PASSED'
    end

    it 'displays validation error when customer is not selected' do
      visit new_deposit_path

      fill_in 'amount', with: 100.0
      click_button 'Depositar'

      expect(page).to have_text('Cliente não pode ficar em branco')
      puts 'Teste: displays validation error when customer is not selected - PASSED'
    end

    it 'displays validation error when classroom is not selected' do
      visit new_deposit_path

      fill_in 'amount', with: 200.0
      click_button 'Depositar'

      expect(page).to have_text('Sala de aula não pode ficar em branco')
      puts 'Teste: displays validation error when classroom is not selected - PASSED'
    end
  end
end
