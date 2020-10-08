class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

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