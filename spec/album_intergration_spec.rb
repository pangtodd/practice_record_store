# require('capybara/rspec')
# require('./app')
# Capybara.app = Sinatra::Application
# set(:show_expectation, false)

# # describe('create an album path', {:type => :feature}) do
# #   it('creates an album and then goes to the album page') do
# #     visit('/albums')
# #     click_on('click here to add a new album')
# #     fill_in('album_name', :with => 'Yellow Submarine')
# #     click_on('Gooooo!')
# #     expect(page).to have_content('Yellow Submarine')
# #   end
# # end

# # describe('create a song path', {:type => :feature}) do
# #   it('creates an album and then goes to the album page')do
# #     album = Album.new("Yellow Submarine", nil)
# #     album.save
# #     visit("/albums/#{album.id}")
# #     fill_in('song_name', :with => 'All You Need Is Love')
# #     click_on('ADD SONG.')
# #     expect(page).to have_content('All You Need Is Love')
# #   end
# # end