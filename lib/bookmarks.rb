require 'database'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(hash)
    @id  = hash[:id]
    @title = hash[:title]
    @url = hash[:url]
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks").map { |bookmark| Bookmarks.new(bookmark) }
  end

  def self.create(url:, title:)
    Bookmarks.new(DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;").last)
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.find(id:)
    Bookmarks.new(DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}").last)
  end

  def self.update(id:, url:, title:)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = '#{id}';")
  end

end
