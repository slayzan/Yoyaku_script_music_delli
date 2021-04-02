require 'nokogiri'
require 'open-uri'
require 'pp'
require_relative 'lib/album'

file = File.read("data/input.xml")

xml = Nokogiri::XML(file)

def nbSongs(xml)
    nbSongs = 0
    xml.xpath("//TrackNumber").each { |track| nbSongs = nbSongs + 1}
    return nbSongs
end


def createRelease(xml)
    release = Array.new
    release[0] = Release.new(xml.xpath("//Name")[0].content, xml.xpath("//Catalog")[0].content, xml.xpath("//Artists")[0].content, xml.xpath("//Label")[0].content,
    xml.xpath("//MainGenre")[0].content, xml.xpath("//Genre")[0].content, xml.xpath("//PYear")[0].content)
    return release
end

def createSongs(xml)
    release = createRelease(xml)
    i = 0
    j = 1
    1.upto(nbSongs(xml)) do |song|
       
        release[j] = Songs.new(xml.xpath("//TrackNumber")[i].content, xml.xpath("//MainGenre")[i].content, xml.xpath("//Genre")[i].content, xml.xpath("//Name")[i].content)
        i = i + 1
        j = j + 1
    end
    return release
end

test = createSongs(xml)
pp test[1].name



test = xml.xpath("//Label")[0].content

# xml.xpath("//Name").each do |node|
   # pp node.content
 #end