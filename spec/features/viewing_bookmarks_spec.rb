require 'pg'

feature 'Viewing Bookmarks' do
  scenario 'displays the bookmarks for the user' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")

    visit('/bookmarks')
    
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
