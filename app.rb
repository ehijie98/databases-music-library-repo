require_relative 'lib/database_connection'
require './lib/artist_repository'
require './lib/album_repository'

DatabaseConnection.connect('music_library')

# artist_repository = ArtistRepository.new

# artist_repository.all.each do |artist|
#     p artist
# end

album_repository = AlbumRepository.new

p album_repository.find(1).title
# album_repository.all.each do |album|
#     p album.title
# end

repository = AlbumRepository.new

album = Album.new
album.title = 'Trompe le Monde'
album.release_year = 1991
album.artist_id = 7

repository.create(album)

all_albums = repository.all

p all_albums





