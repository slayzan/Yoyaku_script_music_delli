require 'nokogiri'
require 'open-uri'
require 'pp'
require_relative 'lib/release'
require_relative 'lib/builder'

file = File.read("data/input.xml")

xml = Nokogiri::XML(file)

def nbSongs(xml)
    nbSongs = 0
    xml.xpath("//TrackNumber").each { |track| nbSongs = nbSongs + 1}
    return nbSongs
end

def createSongs(xml)
    release = Array.new
    i = 0
    j = 1
    j.upto(nbSongs(xml)) do |song|
        release[i] = Song.new(xml.xpath("//Name")[j].content, xml.xpath("//PrimaryArtists")[i].content, xml.xpath("//MainGenre")[i].content,
        xml.xpath("//Genre")[j].content,xml.xpath("//TrackNumber")[i].content, xml.xpath("//AudioFile")[i].content) rescue nil
        j = j + 1
        i = i + 1
    end
    nilProtection(xml,release)
end

def nilProtection(xml,release)
    i = 1
    xml.xpath("//Short_description").each do |node|
        release[i].add_description(node.content) rescue nil
        i = i + 1
    end
    i = 1
    xml.xpath("//FeaturingArtists").each do |node|
        release[i].add_featArtists(node.content) rescue nil
        i = i + 1
    end
    i = 1
    xml.xpath("//Product_categories").each do |node|
        release[i].add_description(node.content) rescue nil
        i = i + 1
    end
    build_xml(release,xml)
end

test = createSongs(xml)


#build_xml(test)
test = xml.xpath("//Label")[0].content
# xml.xpath("//Name").each do |node|
   # pp node.content
 #end