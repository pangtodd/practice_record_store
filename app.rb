require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

get('/test')do
  @something = "this is a variable, dum-dum."
  erb(:whatever)
end

get('/') do
  @albums = Album.all
  erb(:albums)
  # "this will be out home page. '/' is always the root route in a Sinatra Application"
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
  # "this route will show us a list of all albums"
end

post('/albums')do
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
  #"this will take us to a page with a form for adding a new album"
end

get('/albums/new') do
  "this will take us to a page with a form for adding a new album."
end

get('/albums/:id')do
  @album = Album.find(params[:id].to_i())
  erb(:album)
  #"this route will show a specific album based on its ID. The value of ID here is #{params[:id]}"
end

post('/albums') do
  "this route will add an album to our list of albums. We can't access this by typing in the URL. IIn a future lesson, we will use a form that specifies a POST action to reach this route."
end

get('/albums/:id/edit') do
  "this will take us to a page with a form for updating an album with an ID of #{params[:id]}."
end

patch('/albums/:id') do
  #"this route will update an album. We can't reach it with a URL. In a future lesson, we will use a form that specifices a PATCH action to reach this route"
end

delete('/albums/:id') do
  "this route will delete an album. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route."
end

get('/custom_route') do
  "we can even create custom routes, but we should only do this when needed."
end