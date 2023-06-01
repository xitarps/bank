require 'rails_helper'

RSpec.describe 'Root' do
  context 'Administrator' do
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Administrator.destroy_all }
    before(:each) { Root.destroy_all }
    after(:each) { Tax.destroy_all }
    it 'Create Administrator' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      visit '/'

      click_on 'Administradores'
      click_on 'New administrator'

      name = Faker::Ancient.god

      fill_in 'name', with: name

      click_on 'Criar Administrator'
      expect(page).to have_content(name)
    end
    it 'Edit Administrator' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:administrator)
      visit '/administrators'

      click_on 'Edit'

      name2 = Faker::Ancient.god

      fill_in 'name',	    with: name2

      click_on 'Atualizar Administrator'
      expect(page).to have_content(name2)
    end
  end
end
