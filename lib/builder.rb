def build_xml(release)
    builder = Nokogiri::XML::Builder.new do |xml|
        xml.data {
            xml.post {
                xml.title = release[0].title
                xml.sku = release[0].sku
                xml.short_description = release[0].short_description

            }
        }
    end
    puts builder.to_xml
end