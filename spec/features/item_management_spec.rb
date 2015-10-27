require 'rails_helper'

feature 'Item management' do
  context 'User tries to create an item' do
    context 'with no title' do
      scenario 'it fails' do
        sign_in_user
        click_on('New Item')

        within('form') do
          fill_in 'Link URL', with: 'http://example.com'
          click_on 'Create Item'
        end

        expect(page).to have_content('Please enter a Title')
      end
    end

    context 'with no url' do
      scenario 'it fails' do
        sign_in_user
        click_on('New Item')

        within('form') do
          fill_in 'Link Title', with: 'Example'
          click_on 'Create Item'
        end

        expect(page).to have_content('Please enter a URL')
      end
    end

    context 'with propper attributes' do
      scenario 'creates the item' do
        sign_in_user
        click_on('New Item')

        within('form') do
          fill_in 'Link Title', with: 'Example'
          fill_in 'Link URL', with: 'http://example.com'
          click_on 'Create Item'
        end

        within('div.item') do
          expect(page).to have_content('Example')
        end
      end
    end
  end

  context 'User tries to edit an item' do
    scenario 'by changing the title' do
      create(:item, title: 'Ugly Kitty!')
      sign_in_user

      within('div.meta') do
        click_on('Edit')
      end

      fill_in 'Link Title', with: 'Cute Kitty!'
      click_on('Update Item')

      within('div.item') do
        expect(page).to have_content('Cute Kitty!')
      end
    end
  end

  scenario 'User tries to delete an item' do
    item = create(:item)
    sign_in_user

    within('div.meta') do
      click_on('Edit')
    end

    click_on('Delete Item')

    within('div#items') do
      expect(page).not_to have_content(item.title)
    end
  end
end
