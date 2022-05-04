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