require 'rails_helper'

RSpec.describe 'Root' do
  context 'Tax' do
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
    after(:each) { Tax.destroy_all }
    it 'Create Tax' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      visit '/'

      click_on 'Taxas'
      click_on 'Nova taxa'

      name = Faker::Ancient.god

      fill_in 'Nome',	    with: name
      fill_in 'Valor',    with: Faker::Number.decimal(l_digits: 2, r_digits: 2)

      click_on 'Enviar'
      expect(page).to have_content(name)
    end
    it 'Edit Tax' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:tax)
      visit '/taxes'

      click_on 'Mostrar'
      click_on 'Editar'

      name2 = Faker::Ancient.god

      fill_in 'Nome',	    with: name2
      fill_in 'Valor',    with: Faker::Number.decimal(l_digits: 2, r_digits: 2)

      click_on 'Enviar'
      expect(page).to have_content(name2)
    end
  end
end
