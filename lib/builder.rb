def build_xml(release, file)
    i = 1
    builder = Nokogiri::XML::Builder.new do |xml|
        xml.data {
            xml.post {
                xml.title file.xpath("//Name")[0].content
                xml.sku file.xpath("//Catalog")[0].content
                xml.slug file.xpath("//Catalog")[0].content
                xml.sku_ep file.xpath("//Catalog")[0].content
                xml.artists file.xpath("//Artists")[0].content
                xml.label file.xpath("//Label")[0].content
                xml.genres "#{file.xpath("//MainGenre")[0].content}|#{file.xpath("//Genre")[0].content}"
                xml.years file.xpath("//PYear")[0].content
                xml.type "release"
                xml.price fullPrice(release)
                xml.description nil
                xml.owners "music deli"
                xml.product_visibility "visible"
                xml.featured_image "https://www.aze.digital/wp-content/uploads/2021/#{file.xpath("//Catalog")[0].content}.jpg"
                xml.download_file_name "#{file.xpath("//Artists")[0].content} - #{file.xpath("//Name")[0].content} #{file.xpath("//Catalog")[0].content}"
                xml.file_path nil
                xml.playlist_data  buildDataTrack(release,file)
            }
            release.each do |song|
                xml.post{
                    xml.title song.name
                    xml.sku "#{file.xpath("//Catalog")[0].content}-#{song.track_number}"
                    xml.short_description song.description
                    xml.slug song.slug
                    xml.sku_ep file.xpath("//Catalog")[0].content
                    xml.product_tags nil
                    xml.product_categories nil
                    xml.artists song.feat_artist ? "#{song.artists}|#{song.feat_artist}" : song.artists
                    xml.label file.xpath("//Label")[0].content
                    xml.genres "#{song.main_genre}|#{song.secondary_genre}"
                    xml.years file.xpath("//PYear")[0].content
                    xml.type "song"
                    xml.price song.price
                    xml.owners "music deli"
                    xml.product_visibility "hidden"
                    xml.featured_image "https://www.aze.digital/wp-content/uploads/#{file.xpath("//PYear")[0].content}/#{file.xpath("//Catalog")[0].content}.jpg"
                    xml.download_file_name song.feat_artist ? "#{song.artists} & #{song.feat_artist} - #{song.name} #{file.xpath("//Catalog")[0].content}.wav" : "#{song.artists} - #{song.name} #{file.xpath("//Catalog")[0].content}.wav"
                    xml.playlist_data  song.feat_artist ? "<a href=\"http:\/\/player.yoyaku.io/mp3/#{file.xpath("//Catalog")[0].content}_#{song.track_number}.mp3>#{song.artists} & #{song.feat_artist} - #{song.name}</a>" :  "<a href=\"http:\/\/player.yoyaku.io/mp3/#{file.xpath("//Catalog")[0].content}_#{song.track_number}.mp3>#{song.artists} - #{song.name}</a>"
            }
            end
        }
    end
    File.open("data/output.xml", 'w'){ |f| f.write(builder.to_xml)}
end