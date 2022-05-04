require 'rspec'
require 'song'
require 'album'
require 'pry'

describe '#Song' do

  before(:each)do
    Album.clear()
    Song.clear()
    @album = Album.new("Giant Steps", nil)
    @album.save()
  end

  describe('#==')do
    it ("is the same song if it has the same attributes as another song")do
      song=Song.new("Naima", @album.id, nil)
      song2=Song.new("Naima", @album.id, nil)
      expect(song).to eq(song2)
    end
  end

  desrcibe('.all') do
    it("returns a lit of all songs")do
      song= Song.new("Giant Steps", @album.id, nil)
      song.save
      song2 = Song.new("Naima", @album.id, nil)
      song2.save
      expect(Song.all).to eq([song, song2])
    end
  end

  describe('.clear')do
    it("clears all songs")do
      song= Song.new("Giant Steps", @album.id, nil)
      song.save()
      song2= Song.new("Naima",@album.id, nil)
      song2.save()
      Song.clear()
      expect(Song.all).to eq([])
    end
  end

  describe('#save')do
    it("saves a song/bang a gong/get it on")do
      song = Song.new("Naima", @album.id, nil)
      song.save()
      expect(Song.all).to eq([song])
    end
  end

  describe('.find')do
    it("finds a song using id")do
    song = Song.new("Giant Steps", @album.id, nil)
    song.save()
    song2 = Song.new("Naima", @album.id, nil)
    song2.save()
    expect(song.find(song.id)).to eq(song)
    end
  end

  describe('#update')do
    it("updates a song by id")do
      song= Song.new("Naima", @album.id, nil)
      song.save()
      song.update("Mr. P.C.", @album.id)
      expect(song.name).to eq("Mr. P.C.")
    end
  end

  describe('#delete') do
    it("deletes a song by id") do
      song= Song.new("Giant Steps", @album.id, nil)
      song.save()
      song2 = Song.new("Naima", @album.id, nil)
      song2.save()
      song.delete()
      expect(Song.all).to eq([song2])
    end
  end


