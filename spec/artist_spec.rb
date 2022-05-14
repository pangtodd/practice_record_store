require 'spec_helper'

describe 'Artist' do

  describe('.all')do
    it("returns and empty array when there are no artists.")do
      expect(Artist.all).to eq([])
    end
  end
  describe('#save')do
    it("saves an artist")do
      artist = Artist.new({:name => "Kool Moe Dee", :id=>nil})
      artist.save()
      artist2 = Artist.new({:name => "Big Daddy Kane", :id=>nil})
      artist2.save()
      expect(Artist.all).to eq([artist, artist2])
    end
  end  
  describe('#==')do
    it("is the same artist if is has the same attributes as another artist")do
      artist = Artist.new({:name => "EPMD", :id=>nil})
      artist.save()
      artist2 = Artist.new({:name => "EPMD", :id=>nil})
      expect(artist).to eq(artist2)
    end
  end
  describe('.clear')do
    it("clears all artits)")do
      artist = Artist.new({:name => "Kool Moe Dee", :id=>nil})
      artist.save()
      artist2 = Artist.new({:name => "Big Daddy Kane", :id=>nil})
      artist2.save()
      Artist.clear()
      expect(Artist.all).to eq([])
    end
  end
  describe('.find')do
    it("finds an artist by id")do
    artist = Artist.new({:name => "Kool Moe Dee", :id=>nil})
    artist.save()
    artist2 = Artist.new({:name=>"Def Jef", :id=>nil})
    artist2.save()
    expect(Artist.find(artist2.id)).to eq(artist2)
    end
  end
  describe('#update')do
    it("updates an artist by id")do
      artist = Artist.new({:name=>"Old Dirty Bastard", :id=>nil})
      artist.save()
      artist.update("Big Baby Jesus")
      expect(artist.name).to eq("Big Baby Jesus")
    end
  end
  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end
  # describe('#delete')do
  #   it("deletes all songs and albums belonging to a deleted artist????")do
  #     album = Album.new({:name=>"Coolin in Cali", :id=>nil})
  #     album.save()
  #     song = Song.new({:name=>"Goes Like Dis", :album_id=>album.id, :id=>nil})
  #     song.save()
  #     artist = Artist.new({:name=>"7a3", :id =>nil})
  #     artist.delete()
  #     expect(Album.find(album.id)).to eq(nil)
  #   end
  # end

end