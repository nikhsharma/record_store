require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :stock, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @stock = options['stock'].to_i
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, stock, genre, artist_id) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@title, @stock, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, stock, genre) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @stock, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

end
