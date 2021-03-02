require 'database'

describe DatabaseConnection do

  context '.setup' do
      it 'should set up a connection with a database' do
        DatabaseConnection.setup('bookmark_manager_test')
        DatabaseConnection.link.exec("INSERT INTO bookmarks (url, title) VALUES('http//www.test.com', 'Test Site');")
        expect(Bookmarks.all.last.title).to eq 'Test Site'
        expect(Bookmarks.all.last.url).to eq 'http//www.test.com'
      end
  end

  context '.query' do
    it 'should execute a query' do
      DatabaseConnection.setup('bookmark_manager_test')
      DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('http//www.test.com', 'Test Site');")    
      expect(Bookmarks.all.last.title).to eq 'Test Site'
      expect(Bookmarks.all.last.url).to eq 'http//www.test.com'
  end
  end

end