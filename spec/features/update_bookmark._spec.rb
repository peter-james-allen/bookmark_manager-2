feature 'update a bookmark' do
  scenario 'A user can update a bookmark in the Bookmark Manager' do
    Bookmarks.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')

    visit '/bookmarks'
    click_button 'Edit'

    fill_in('url', with: "http://www.newbookmark.com")
    fill_in('title', with: "New Bookmark")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
    expect(page).to have_link('New Bookmark', href: 'http://www.newbookmark.com')
  end
end
