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


def createRelease(xml)
    release = Array.new
    release[0] = Release.new(xml.xpath("//Name")[0].content, xml.xpath("//Artists")[0].content, xml.xpath("//MainGenre")[0].content, xml.xpath("//Genre")[0].content)
    release[0].init_release(xml.xpath("//Catalog")[0].content, xml.xpath("//Label")[0].content,xml.xpath("//PYear")[0].content)
    return release
end

def createSongs(xml)
    release = createRelease(xml)
    i = 0
    j = 1
    j.upto(nbSongs(xml)) do |song|
        release[j] = Songs.new(xml.xpath("//Name")[j].content, xml.xpath("//PrimaryArtists")[i].content, xml.xpath("//MainGenre")[j].content, xml.xpath("//Genre")[j].content, xml.xpath("//TrackNumber")[i].content)
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
    xml.xpath("//Product_tags").each do |node|
        release[i].add_description(node.content) rescue nil
        i = i + 1
    end
    i = 1
    xml.xpath("//Product_categories").each do |node|
        release[i].add_description(node.content) rescue nil
        i = i + 1
    end
    build_xml(release)
end

test = createSongs(xml)


#build_xml(test)
test = xml.xpath("//Label")[0].content
# xml.xpath("//Name").each do |node|
   # pp node.content
 #end