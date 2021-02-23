# frozen_string_literal: true

feature 'Test infrastructure' do
  scenario 'Testing index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
