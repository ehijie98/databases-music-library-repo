require './app.rb'

RSpec.describe Application do
    it "greets the user and lists all albums" do
        io = double :io
        album_repository = double :album_repository
        artist_repository = double :artist_repository

        expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
        expect(io).to receive(:puts).with("What would you like to do?").ordered
        
    end
   
end