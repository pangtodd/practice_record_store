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
end