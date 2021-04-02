class Release
    attr_accessor :title, :sku, :artists, :label, :main_genre, :secondary_genre, :pYear, :type, :price

    def initialize(title, catalog, artists, label, main_genre, secondary_genre, pYear)
        @title = title
        @sku = catalog
        @label = label
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @pYear = pYear
    end
end
class Songs < Release
    attr_accessor :trackNumber, :main_genre, :secondary_genre, :name

    def initialize(trackNumber, main_genre, secondary_genre, name)
        @trackNumber = trackNumber
        pp @trackNumber
        @main_genre = main_genre
        @secondary_genre = secondary_genre
        @name = name
    end
end