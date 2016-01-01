require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the updated data for the individual artist" do
    artist = Artist.create(name: 'Bob', image_path: 'http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg')
    updated_name = "Peter"

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: updated_name
    click_on "Update Artist"

    expect(page).to have_content updated_name
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end










# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image
