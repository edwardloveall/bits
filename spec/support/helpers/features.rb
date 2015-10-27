module Helpers
  module Features
    def sign_in_user(user = create(:user))
      visit root_path
      click_on 'Sign in'
      within('form') do
        fill_in :username, with: user.username
        fill_in :password, with: user.password
        click_on 'Sign in'
      end
    end
  end
end
