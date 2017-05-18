# As a user


# And I click "New song"
# And I fill in the title
# And I click "Create Song"
# Then I should see the song name
# And I should see a link to the song artist's individual page

require 'rails_helper'

RSpec.feature 'User can creates a song' do
  scenario 'they see a page for the individual song' do
    # Given that artists exist in the database
    artist = create(:artist)
    song_title = 'One Love'

    # When I visit the artist songs index
    visit artist_path(artist)

    click_on 'New song'
    fill_in 'song_title', with: song_title
    click_on 'Create Song'

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)

  end
end