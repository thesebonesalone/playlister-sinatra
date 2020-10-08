class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    def slug
        slug = self.name.downcase
        slug.split('').select{|letter| "abcdefghijklmnopqrstuvwxyz1234567890 ".include? letter}.map do |letter|
            if letter == " "
                "-"
            else
                letter
            end
        end.join
    end
    def self.find_by_slug(slug)
        self.all.find do |value|
            value.slug == slug
        end
    end
end