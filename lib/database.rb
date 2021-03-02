require 'pg'

class DatabaseConnection

  @link = ''

  def self.setup(database)
    @link = PG.connect(dbname: database)
  end
  
  def self.query(query_string)
    @link.exec(query_string).map { |result| result.transform_keys(&:to_sym) }
  end

  def self.link
    @link
  end

end