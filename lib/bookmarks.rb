require 'pg'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(hash)
    @id  = hash[:id]
    @title = hash[:title]
    @url = hash[:url]
  end

  def self.all
    result = query("SELECT * FROM bookmarks").map { |bookmark| Bookmarks.new(bookmark) }
  end

  def self.create(url:, title:)
    result = query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;").last
    Bookmarks.new(result)
  end

  def self.delete(id:)
    query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.find(id:)
    Bookmarks.new(query("SELECT * FROM bookmarks WHERE id = #{id}").last)
  end

  def self.update(id:, url:, title:)
    query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = '#{id}';")
  end

  def self.query(query_string)
    results = PG.connect(dbname: "bookmark_manager#{ENV['ENVIRONMENT']}").exec(query_string)
    results.map { |result| result.transform_keys(&:to_sym) }
  end

end
