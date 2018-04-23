require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :stock, :genre, :buy_price, :sell_price, :artwork

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @stock = options['stock'].to_i
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @artwork = options['artwork']
  end

  def save()
    sql = "INSERT INTO albums (title, stock, genre, artist_id, buy_price, sell_price, artwork) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
    values = [@title, @stock, @genre, @artist_id, @buy_price, @sell_price, @artwork]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, stock, genre, buy_price, sell_price) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@title, @stock, @genre, @buy_price, @sell_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)[0]
    return Artist.new(result)
  end

  def stock_level()
      return "Low" if @stock < 4
      return "Medium" if @stock >= 4 && @stock < 7
      return "High" if @stock >= 7
  end

  def markup()
    return @sell_price - @buy_price
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [id]
    result =  SqlRunner.run(sql, values)
    return Album.new(result[0])
  end

  def self.all()
    sql = "SELECT albums.* FROM albums INNER JOIN artists on albums.artist_id = artists.id ORDER BY artists.name ASC;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

end
