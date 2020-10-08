# Add seed data here. Seed your database with `rake db:seed`

require 'pry'

["Thriller","Billie Jean","Black and White","Smooth Criminal"].each do |value|
    Song.create(:name => value)
end
["Rock","Pop","Blues"].each do |value|
    Genre.create(:name => value)
end
["Michael Jackson","Michael Buble","Michael Bolton"].each do |value|
    Artist.create(:name => value)
end

song_genre1 = SongGenre.create(:song => Song.all[0], :genre => Genre.all[0])

binding.pry

0