require 'database_helpers'
require 'bookmarks'

describe Bookmarks do

  describe '.all' do
   it 'returns a list of bookmarks' do
     connection = PG.connect(dbname: 'bookmark_manager_test')

     # Add the test data
     bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
     Bookmarks.create(url: "http://www.google.com", title: "Google")

     bookmarks = Bookmarks.all

     expect(bookmarks.length).to eq 2
     expect(bookmarks.first).to be_a Bookmarks
     expect(bookmarks.first.id).to eq bookmark.id
     expect(bookmarks.first.title).to eq 'Makers Academy'
     expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmarks.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmarks.delete(id: bookmark.id)

      expect(Bookmarks.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the given bookmark' do
      bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      Bookmarks.update(id: bookmark.id, title: 'New Bookmark', url: 'http://www.testsite.com')
      expect(Bookmarks.find(id: bookmark.id).title).to eq 'New Bookmark'
      expect(Bookmarks.find(id: bookmark.id).url).to eq 'http://www.testsite.com'
    end
  end

  describe '.find' do
    it 'updates the given bookmark' do
      bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(Bookmarks.find(id: bookmark.id).title).to eq 'Makers Academy'
      expect(Bookmarks.find(id: bookmark.id).url).to eq 'http://www.makersacademy.com'
    end
  end

end
