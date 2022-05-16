require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('./lib/song')
require('./lib/artist')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "record_store"})

get('/test')do
  @something = "this is a variable, dum-dum."
  erb(:whatever)
end

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get('/artists')do
  @artists = Artist.all
  erb(:artists)
end

post('/albums')do
  name = params[:album_name]
  album = Album.new({:name=>name, :id=>nil})
  album.save()
  @albums = Album.all()
  erb(:albums)
end

post('/artists')do
  name = params[:artist_name]
  artist = Artist.new({:name=> name, :id=>nil})
  artist.save()
  @artists = Artist.all()
  erb(:artists)
end

get('/albums/new') do
  erb(:new_album)
end

get('/artists/new')do
  erb(:new_artist)
end

get('/albums/:id')do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/artists/:id')do
  @artist = Artist.find(params[:id].to_i())
  erb(:artist)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

get('/artists/:id/edit') do
  @artist = Artist.find(params[:id].to_i())
  erb(:edit_artist)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
  #"this route will update an album. We can't reach it with a URL. In a future lesson, we will use a form that specifices a PATCH action to reach this route"
end

patch('/artists/:id')do
  @artist = Artist.find(params[:id].to_i())
  @artist.update({:name=> params[:name]})
  @artists = Artist.all
  erb(:artists)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
  #"this route will delete an album. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route."
end

delete('/artists/:id')do
  @artist = Artist.find(params[:id].to_i())
  @artist.delete()
  @artists = Artist.all
  erb(:artists)
end

post('/albums/:id/songs')do
  @album = Album.find(params[:id].to_i())
  song = Song.new({:name=>params[:song_name], :album_id=>@album.id, :id=>nil})
  song.save()
  erb(:album)
end

get('/albums/:id/songs/:song_id') do
  @song = Song.find(params[:song_id].to_i())
  erb(:song)
end

patch('/albums/:id/songs/:song_id')do
  @album = Album.find(params[:id].to_i())
  song = Song.find(params[:song_id].to_i())
  song.update(params[:name], @album.id)
  erb(:album)
end

delete('/albums/:id/songs/:song_id')do
  song = Song.find(params[:song_id].to_i())
  song.delete
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/custom_route') do
  "we can even create custom routes, but we should only do this when needed."
end