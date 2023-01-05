require_relative './artist'

class ArtistRepository
    def all
        sql = 'SELECT id, name, genre FROM artists;'
        result_set = DatabaseConnection.exec_params(sql, [])


        artists = []

        result_set.each do |record|
            artist = Artist.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            artists << artist
        end

        return artists
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, name, genre FROM artists WHERE id = $1;
  
      # Returns a single Artist object.
    end
  
    # Inserts new record into Artist array
    # Two arguments: the artist (name), the artist (genre)
    def create(name, genre)
        # Executes the SQL query:
        # INSERT INTO artists
        #   (name, genres)
        #   VALUES(name, genre);
    end
  
    # Updates an Artist object's name
    # One argument: the artist (name)
    def update_name(artist)
        # Executes the SQL query:
        # UPDATE artists SET [name] = [new_value] where [name] = [artist];

        # Returns updated array
    end

    # Updates an Artist object's genre
    def update_genre(artist)
        # Executes the SQL query:
        # UPDATE artists SET [genre] = [new_genre] where [name] = [artist];

        # Returns updated array
    end
  
    # Deletes an Artist object
    def delete(artist)
        # Executes the SQL query:
        # DELETE FROM artists WHERE [name] = artist;
        
        # Returns updated array
    end
  end
