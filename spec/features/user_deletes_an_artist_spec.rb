# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
require 'rails_helper'

RSpec.feature 'User can delete an artist' do
  scenario 'they can see the artist page without the deleted artist' do
    name = "Jyll Justamond"
    artist = Artist.create(name: name,
                           image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    name2 = "Madonna"
    artist2 = Artist.create(name: name2,
                           image_path: "https://pbs.twimg.com/profile_images/846884317636759552/E8bUDRDa.jpg")

    visit artist_path(artist)
    click_on 'Delete'

    expect(page).to have_content name2
    expect(page).not_to have_content name


  end
end