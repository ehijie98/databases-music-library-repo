require 'album_repository'

RSpec.describe AlbumRepository do

  def reset_albums_table
      seed_sql = File.read('spec/seeds_albums.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
      connection.exec(seed_sql)
  end
      
      
  before(:each) do 
    reset_albums_table
  end

    
  it "returns a list of albums" do
    repo = AlbumRepository.new
        
    albums = repo.all

    expect(albums.length).to eq 2
    expect(albums[0].title).to eq "Homework"
    expect(albums[0].release_year).to eq 1997
    expect(albums[0].artist_id).to eq 1
  end
    
  context "in a table with two recorded albums" do
    it "returns Homework as a single album" do
      repo = AlbumRepository.new

      album = repo.find(1)

      expect(album.title).to eq "Homework"
      expect(album.release_year).to eq 1997
      expect(album.artist_id).to eq 1
    end

    it "returns Take Care as a single album" do
      repo = AlbumRepository.new

      album = repo.find(2)

      expect(album.title).to eq "Take Care"
      expect(album.release_year).to eq 2011
      expect(album.artist_id).to eq 2
    end
  end

 
  it "creates new Album object" do
    repo = AlbumRepository.new

    new_album = Album.new
    new_album.title = "Trompe le Monde"
    new_album.release_year = 1991
    new_album.artist_id = 3

    repo.create(new_album)
    all_albums = repo.all
    
    expect(all_albums).to include(
      have_attributes(
        title: new_album.title, 
        release_year: 1991,
        artist_id: 3
      )
    )
  end
end
