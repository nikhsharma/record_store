class Album

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @stock = options['stock'].to_i
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

end
