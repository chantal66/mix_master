# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image
require 'rails_helper'

RSpec.feature 'User can edit an artist' do
  scenario 'they see artist info just updated' do
    name = "Jyll Justamond"
    artist = Artist.create(name: name,
                           image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on 'Edit'
    fill_in 'artist_name', with: name
    fill_in 'artist_image_path', with: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    click_on 'Update Artist'

    expect(page).to have_content name
  end
end