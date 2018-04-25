require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

  attr_reader :id
  attr_accessor :name, :profile_image

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @profile_image = options['profile_image']
  end

  def save()
    sql = "INSERT INTO artists (name, profile_image) VALUES ($1, $2) RETURNING id;"
    values = [@name, @profile_image]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET (name, profile_image) = ($1, $2) WHERE id = $3;"
    values = [@name, @profile_image, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1 ORDER BY title;"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return Album.map_albums(albums)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Artist.new( result.first )
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM artists WHERE name = $1;"
    values = [name]
    artists = SqlRunner.run(sql, values)
    return map_artists(artists)[0]
  end

  def self.all()
    sql = "SELECT * FROM artists ORDER BY name ASC;"
    artists = SqlRunner.run(sql)
    return map_artists(artists)
  end

  def self.all_desc()
    sql = "SELECT * FROM artists ORDER BY name DESC;"
    artists = SqlRunner.run(sql)
    return map_artists(artists)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.map_artists(artists)
    return artists.map { |artist| Artist.new(artist)}
  end

end
