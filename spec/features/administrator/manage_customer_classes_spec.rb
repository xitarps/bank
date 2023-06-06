require 'rails_helper'

RSpec.describe 'CustomerClass', type: :feature do
  before(:each) do
    User.destroy_all
    Customer.destroy_all
    Administrator.destroy_all
    Root.destroy_all
    Tax.destroy_all
    Classroom.destroy_all
    CustomerClass.destroy_all
  end
  after(:each) do
    CustomerClass.destroy_all
    User.destroy_all
    Customer.destroy_all
  end

  context 'Administrator' do
    let(:user) { create(:user, :confirmed, :administrator) }

    before(:each) do
      login_as(user, scope: :user)
    end

    it 'Create CustomerClass' do
      customer = create(:user, :confirmed).userable
      classroom = create(:classroom)

      visit '/'
      click_on 'Alunos'
      click_on 'Atrela aluno'

      select(customer.first_name.to_s, from: 'Aluno')
      select(classroom.name.to_s, from: 'Turma')

      click_on 'Atrelar'

      expect(page).to have_content(customer.first_name)
    end

    it 'Create CustomerClass - invalid' do
      classroom = create(:classroom)
      visit '/'
      click_on 'Alunos'
      click_on 'Atrela aluno'
      click_on 'Atrelar'

      select(classroom.name.to_s, from: 'Turma')

      click_on 'Atrelar'

      expect(page).to have_content('Customer é obrigatório(a)')
    end

    it 'Edit CustomerClass' do
      create(:customer_class)
      customer = create(:customer)
      classroom = create(:classroom)
      visit '/customer_classes'

      click_on 'Editar'

      select(customer.first_name.to_s, from: 'Aluno')
      select(classroom.name.to_s, from: 'Turma')

      click_on 'Atrelar'

      expect(page).to have_content(customer.first_name)
    end

    it 'Show CustomerClass' do
      customer_class = create(:customer_class)

      visit '/customer_classes'
      click_on 'Detalhes'

      expect(page).to have_content(customer_class.customer.first_name)
      expect(page).to have_content(customer_class.classroom.name)
    end

    it 'Update CustomerClass - Invalid Edit' do
      create(:customer_class)
      visit '/customer_classes'
      click_on 'Editar'

      select('Selecione um cliente', from: 'Aluno')
      click_on 'Atrelar'

      expect(page).to have_content('Customer é obrigatório(a)')
    end

    it 'Destroy CustomerClass' do
      customer_class = create(:customer_class)

      visit '/customer_classes'
      click_on 'Apagar'

      expect(page).not_to have_content(customer_class.customer.first_name)
    end
  end
end
