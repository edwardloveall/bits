require 'rails_helper'

feature 'User management' do
  context 'user creates a new user' do
    context 'with proper attributes' do
      scenario 'and succeeds' do
        sign_in_user
        visit new_user_path

        fill_in 'Name', with: 'Logen'
        fill_in 'Username', with: 'logen'
        fill_in 'Password', with: 'stillalive'
        fill_in 'Password confirmation', with: 'stillalive'
        click_on 'Create User'

        expect(page).to have_content("Logen's bits")
      end
    end

    context 'with missing attributes' do
      scenario 'and fails' do
        sign_in_user
        visit new_user_path

        click_on 'Create User'

        expect(page).to have_content("Password can't be blank")
      end
    end
  end
end
