require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmarks.all
      
      expect(bookmarks).to include('https://www.google.com')
      expect(bookmarks).to include('https://ruby-doc.org')
    end
  end
end
