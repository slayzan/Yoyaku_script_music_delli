=begin
class Release
    attr_accessor :title, :sku, :artists, :label, :main_genre, :secondary_genre, :pYear, :type, :price, :description

    def initialize(title, catalog, artists, label, main_genre, secondary_genre, pYear)
        @title = title
        @sku = catalog
        @label = label
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @pYear = pYear
    end

    def add_description(description)
        @description = description
    end
end

class Songs < Release
    attr_accessor :trackNumber, :main_genre, :secondary_genre, :name, :description

    def initialize(trackNumber, main_genre, secondary_genre, name)
        @trackNumber = trackNumber
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @name = name
    end
end


class Release
    attr_accessor :name, :main_genre, :secondary_genre, :artists, :sku, :label, :pYear, :track_number, :description
    
    def initialize(name, artists, main_genre, secondary_genre)
        @name = name
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @artists = artists
    end

    def init_release(sku, label, pYear)
        @sku = sku
        @label = label
        @pYear= pYear
    end
end
=end

class Song
    attr_accessor :track_number, :description , :name, :main_genre, :secondary_genre, :artists, :slug, :feat_artist
    
    def initialize(name, artists, main_genre, secondary_genre,track_number, slug)
        @name = name
        @artists = artists
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @track_number = track_number
        @slug = slug
    end

    def add_description(description)
        @description = description
    end
    
    def add_featArtists(feat_artist)
        @feat_artist = feat_artist
    end
end