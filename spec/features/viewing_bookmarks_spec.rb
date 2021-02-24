require 'pg'

feature 'Viewing Bookmarks' do
  scenario 'displays the bookmarks for the user' do

    Bookmarks.create(url: "http://www.google.com")
    Bookmarks.create(url: "http://www.makersacademy.com")

    visit('/bookmarks')

    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
