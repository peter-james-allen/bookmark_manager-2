feature 'Test infrastructure' do
  scenario 'Testing index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing Bookmarks' do
  scenario 'displays the bookmarks' do
    visit('/')
    click_button 'Bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
