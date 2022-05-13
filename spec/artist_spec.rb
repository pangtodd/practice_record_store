require 'spec_helper'

describe 'Artist' do
  describe('.all')do
    it("returns and empty array when there are no artists.")do
    expect(Artist.all).to eq([])
    end
  end

  # describe('#save')do
  #     it("saves an artist")do
  #     artist = Artist.new({:name => "Kool Moe Dee", :id=>nil})
  #     artist.save()
  #     artist2 = Artist.new({:name => "Big Daddy Kane", :id=>nil})
  #     expect(artist.all).to eq([artist, artist2])
  #   end
  # end  

  # describe('#==')do
  #     it("is the same artist if is has the same attributes as another artist")do
  #     artist = Artist.new({:name=>"John Coltrane", :id=>nil})
  #     album.save()
  #     artist2 = 
  #     end
  #   end
end