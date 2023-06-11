require 'rails_helper'

RSpec.describe 'Administrator' do
  context 'Manage Tax' do
    before(:each) { User.destroy_all }
    before(:each) { Customer.destroy_all }
    before(:each) { Root.destroy_all }
    after(:each) { Tax.destroy_all }
    it 'Create Tax' do
      user = create(:user, :confirmed, :administrator)
      login_as(user, scope: :user)
      visit '/'

      click_on 'Indexadores'
      click_on 'Novo indexador'

      name = Faker::Ancient.god

      fill_in 'Nome',	    with: name
      fill_in 'Valor',    with: Faker::Number.decimal(l_digits: 2, r_digits: 2)

      click_on 'Confirmar'
      expect(page).to have_content(name)
    end
    it 'Edit Tax' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:tax)
      visit '/taxes'

      click_on 'Detalhes'
      click_on 'Editar'

      name2 = Faker::Ancient.god

      fill_in 'Nome',	    with: name2
      fill_in 'Valor',    with: Faker::Number.decimal(l_digits: 2, r_digits: 2)

      click_on 'Confirmar'
      expect(page).to have_content(name2)
    end
    it 'Destroy Tax' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:tax)
      visit '/taxes'

      click_on 'Detalhes'
      click_on 'Apagar'

      expect(page).to have_content('Indexador apagado com sucesso.')
    end
    it 'Create Invalid Tax' do
      user = create(:user, :confirmed, :administrator)
      login_as(user, scope: :user)
      visit '/'

      click_on 'Indexadores'
      click_on 'Novo indexador'

      fill_in 'Nome',	    with: ''
      fill_in 'Valor',    with: Faker::Number.decimal(l_digits: 2, r_digits: 2)

      click_on 'Confirmar'
      expect(page).to have_content('Nome não pode ficar em branco')
    end
    it 'Edit Tax' do
      user = create(:user, :confirmed, :root)
      login_as(user, scope: :user)
      FactoryBot.create(:tax)
      visit '/taxes'

      click_on 'Detalhes'
      click_on 'Editar'

      fill_in 'Nome',	    with: ''
      fill_in 'Valor',    with: Faker::Number.decimal(l_digits: 2, r_digits: 2)

      click_on 'Confirmar'
      expect(page).to have_content('Nome não pode ficar em branco')
    end
  end
end
