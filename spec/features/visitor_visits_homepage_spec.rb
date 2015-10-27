require 'rails_helper'

feature 'Visitor visits homepage' do
  scenario 'seens sign in link' do
    visit root_path

    link = find_link('Sign in')

    expect(link).to be_visible
  end
end
