def build_xml(release, xml)
    builder = Nokogiri::XML::Builder.new do |xml|
        xml.data {
            xml.post {
                xml.title = release[0].name
                xml.sku = release[0].sku
                xml.slug =  release[0].sku
                xml.sku_ep = release[0].sku
                xml.artists = release[0].artists
                xml.label = release[0].label
                xml.genres = "#{release[0].main_genre}|#{release[0].secondary_genre}"
                xml.years = release[0].pYear
                xml.type = "release"
                xml.price = 8
                xml.owners = "?"
                xml.product_visibility = "visible"
                xml.featured_image = "lien image"
                xml.download_file_name = "lien dl"
                xml.file_path = nil
                xml.playlist_data_album = nil
                xml.playlist_data_track = nil
                xml.sound_files = nil
            }
        }
    end
    puts builder.to_xml
end