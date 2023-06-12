require 'rails_helper'

RSpec.describe 'Deposits' do
  describe 'New Deposit Form' do
    after(:each) do
      CustomerClass.destroy_all
      User.destroy_all
      Customer.destroy_all
      Classroom.destroy_all
    end
    before(:each) do
      CustomerClass.destroy_all
      User.destroy_all
      Customer.destroy_all
      Classroom.destroy_all
    end
    let(:user) { create(:user, :confirmed, :administrator) }
    before(:each) do
      login_as(user, scope: :user)
    end

    it 'creates a deposit for customer' do
      customer = FactoryBot.create(:customer)

      visit '/deposits/new#'

      select("#{customer.full_name.truncate(10)}(#{customer.cpf})", from: 'customer_id')
      find('#customer_form').fill_in('Valor', with: 10.0)
      find('#customer_form').click_button 'Depositar'

      expect(page).to have_text('Depósito criado com sucesso')
    end

    it 'creates a deposit for classroom' do
      FactoryBot.create(:classroom)
      classroom_name = Classroom.first.name
      customer = FactoryBot.create(:customer)
      Classroom.first.customers << customer

      visit new_deposit_path

      select classroom_name, from: 'classroom_id'
      find('#classroom_form').fill_in('Valor', with: 200.0)
      find('#classroom_form').click_button 'Depositar'
      expect(page).to have_text('Depósito criado com sucesso')
    end

    it 'displays validation error when customer is not selected' do
      FactoryBot.create(:classroom)
      Classroom.first.name
      customer = FactoryBot.create(:customer)
      Classroom.first.customers << customer

      visit new_deposit_path
      find('#customer_form').fill_in('Valor', with: 100.0)
      find('#customer_form').click_button 'Depositar'

      expect(page).to have_text('Cliente(s) não pode ficar em branco')
    end

    it 'displays validation error when classroom is not selected' do
      FactoryBot.create(:classroom)
      Classroom.first.name
      customer = FactoryBot.create(:customer)
      Classroom.first.customers << customer

      visit new_deposit_path

      find('#classroom_form').fill_in('Valor', with: 200.0)
      find('#classroom_form').click_button 'Depositar'

      expect(page).to have_text('Cliente(s) não pode ficar em branco')
    end

    it 'displays validation error when customer is not available' do
      FactoryBot.create(:classroom)
      Classroom.first.name
      customer = FactoryBot.create(:customer)

      visit new_deposit_path

      select("#{customer.full_name.truncate(10)}(#{customer.cpf})", from: 'customer_id')
      find('#customer_form').fill_in('Valor', with: 1000.0)
      find('#customer_form').click_button 'Depositar'

      expect(page).to have_text('Saldo deve ser menor que 1000')
    end
  end
end
