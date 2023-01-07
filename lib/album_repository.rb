require_relative './album'

class AlbumRepository
# Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Artist objects.
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |record|
        albums << record_to_album_object(record)
    end
  
    return albums
  end

  def find(id)

    sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)

    record = result_set[0]

    return record_to_album_object(record)
  end

  def create(album)
    sql = 'INSERT INTO 
              albums (title, release_year, artist_id) 
              VALUES($1, $2, $3);'
    params = [album.title, album.release_year, album.artist_id]

    result_set = DatabaseConnection.exec_params(sql, params)
    
  end
end

private

  def record_to_album_object(record)
    album = Album.new
    album.id = record['id'].to_i
    album.title = record['title']
    album.release_year = record['release_year'].to_i
    album.artist_id = record['artist_id'].to_i

    return album
  end