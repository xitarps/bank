require 'rails_helper'

RSpec.describe 'Tax' do
    context 'Tax' do
      it 'Create Tax' do
        visit '/'

        click_on 'Taxes'
        click_on 'New Tax'

        name = Faker::Ancient.god

        fill_in 'Name',	    with: name
        fill_in 'Value',    with: Faker::Number.decimal(l_digits:2, r_digits:2)

        click_on 'Submit'
        expect(page).to have_content(name)
      end
      it 'Edit Tax' do
        visit '/taxes'

        click_on 'Show'
        click_on 'Edit'

        name2 = Faker::Ancient.god

        fill_in 'Name',	    with: name2
        fill_in 'Value',    with: Faker::Number.decimal(l_digits:2, r_digits:2)

        click_on 'Submit'
        expect(page).to have_content(name2)
      end
    end
end