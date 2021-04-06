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
=end
class Release
    attr_accessor :name, :main_genre, :secondary_genre, :artists
    
    def initialize(name, main_genre, secondary_genre, artists)
        @name = name
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @artists = artists
    end
end

class Songs < Release
    attr_accessor :trackNumber
    
    def initialize(name, main_genre, secondary_genre, artists, trackNumber)
        super(name, main_genre, secondary_genre, artists)
        @trackNumber = trackNumber
    end