require 'rails_helper'

RSpec.feature "user views all artists" do
  scenario "they see the name of each artist" do
    artists = %w(Peter Bob Zappa).map do |artist_name|
      Artist.create(name: artist_name, image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    end

    visit artists_path
    # byebug
    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end




# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page
