class Release
    attr_accessor :title, :sku, :short_description, :slug, :sku_ep, :product_tags, :product_categories, :artists, :labels, :genres, :years, :type, :price, :owners, :product_visibility, :featured_image, :download_file_names, :download_file_paths, :playlist_data_track

    def initialize(title, sku, short_description, slug, sku_ep, product_tags, product_categories, artists, labels, genres, years, type, price, owners, product_visibility, featured_image, download_file_names, download_file_paths, playlist_data_track)
        @title = title
        @sku = sku
        @short_description = short_description
        @slug = slug
        @sku_ep = sku_ep
        @product_tags = product_tags
        @product_categories = product_categories
        @artists = artists
        @labels = labels
        @genres = genres
        @years = years
        @type = type
        @price = price
        @owners = owners
        @product_visibility = product_visibility
        @featured_image = featured_image
        @download_file_names = download_file_name
        @download_file_paths = download_file_path
        @playlist_data_track = playlist_data_track
    end   
end