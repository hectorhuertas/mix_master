require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the updated playlist" do
    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song = create(:song, title: 'new_song')
    new_playlist_name = "New playlist name"

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: new_playlist_name
    check "song-#{new_song.id}"
    uncheck "song-#{first.id}"
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name
    expect(page).to_not have_content first.title
    expect(page).to have_content new_song.title
  end
end

# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song
