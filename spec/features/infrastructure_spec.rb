feature 'Test infrastructure' do
  scenario 'Testing index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing Bookmarks' do
  scenario 'User viewing the bookmarks' do
    visit('/')
    click_button 'Bookmarks'
    expect(page).to have_content 'Here are your bookmarks'
  end
end
