class Song
    attr_accessor :track_number, :description , :name, :main_genre, :secondary_genre, :artists, :slug, :feat_artist, :price
    
    def initialize(name, artists, main_genre, secondary_genre,track_number, slug, price)
        @name = name
        @artists = artists
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @track_number = track_number
       @slug = "#{slug}_#{track_number}"
        @price = price
    end

    def add_description(description)
        @description = description
    end
    
    def add_featArtists(feat_artist)
        @feat_artist = feat_artist
    end
end