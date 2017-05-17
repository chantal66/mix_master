# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page

require 'rails_helper'

RSpec.feature 'User can view all artists' do
  scenario 'they see can see all artist' do
    name = "Bob Marley"
    artist = Artist.create(name: name,
                           image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    visit artists_path
    # save_and_open_page
    expect(page).to have_content name
    expect(page).to have_content 'New artist'
  end
end

