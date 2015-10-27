require 'rails_helper'

feature 'User attempts to sign in' do
  context 'with correct username and password' do
    scenario 'sees New Item link' do
      user = create(:user)

      visit root_path
      click_on 'Sign in'

      within('form') do
        fill_in :username, with: user.username
        fill_in :password, with: user.password
        click_on 'Sign in'
      end

      within('header') do
        expect(page).to have_link('New Item')
      end
    end
  end

  context 'with incorrect username and password' do
    scenario 'does not see the New Item link' do
      user = create(:user)

      visit root_path
      click_on 'Sign in'

      within('form') do
        fill_in :username, with: user.username
        fill_in :password, with: 'incorrect'
        click_on 'Sign in'
      end

      within('header') do
        expect(page).not_to have_link('New Item')
      end
    end
  end
end
