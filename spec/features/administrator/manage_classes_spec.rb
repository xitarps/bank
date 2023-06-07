require 'rails_helper'

RSpec.describe 'Administrator', type: :feature do
  before(:each) do
    User.destroy_all
    Customer.destroy_all
    Administrator.destroy_all
    Root.destroy_all
    Classroom.destroy_all
  end

  context 'Manage Classroom' do
    let(:user) { create(:user, :confirmed, :administrator) }
    # let(:administrator) { create(:administrator) }

    before(:each) do
      login_as(user, scope: :user)
    end

    it 'Create Classroom' do
      visit '/'
      click_on 'Turmas'
      click_on 'Nova Turma'

      name = Faker::Ancient.god
      course = Faker::Educator.subject

      fill_in 'classroom_name', with: name
      fill_in 'classroom_course', with: course

      click_on 'Confirmar'

      expect(page).to have_content(name)
    end

    it 'Create Classroom - invalid' do
      visit '/'
      click_on 'Turmas'
      click_on 'Nova Turma'

      course = Faker::Educator.subject

      fill_in 'classroom_name', with: ''
      fill_in 'classroom_course', with: course

      click_on 'Confirmar'

      expect(page).to have_content('Nome não pode ficar em branco')
    end

    it 'Edit Classroom' do
      FactoryBot.create(:classroom)
      visit '/classrooms'

      click_on 'Editar'

      name = Faker::Ancient.god
      course = Faker::Educator.subject

      fill_in 'classroom_name', with: name
      fill_in 'classroom_course', with: course

      click_on 'Confirmar'

      expect(page).to have_content(name)
    end

    it 'Show Classroom' do
      classroom = create(:classroom)

      visit '/classrooms'
      click_on 'Detalhes'

      expect(page).to have_content(classroom.name)
      expect(page).to have_content(classroom.course)
    end

    it 'Update Classroom - Invalid Edit' do
      FactoryBot.create(:classroom)

      visit '/classrooms'
      click_on 'Editar'

      fill_in 'classroom_name', with: ''

      click_on 'Confirmar'

      expect(page).to have_content('Nome não pode ficar em branco')
    end

    it 'Destroy Classroom' do
      classroom = create(:classroom)

      visit '/classrooms'
      click_on 'Apagar'

      expect(page).not_to have_content(classroom.name)
    end
  end
end
