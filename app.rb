require 'nokogiri'
require 'open-uri'
require 'pp'

file = File.read("data/input.xml")

xml = Nokogiri::XML(file)

def nbSongs(xml)
    nbSongs = 0
    xml.xpath("//TrackNumber").each { |track| nbSongs = nbSongs + 1}
    return nbSongs
end

def createRelease
    release = Array.new
    i = 0
    
    release = Release.new(xml.xpath("//"),)
end
 

pp nbSongs(xml)




#test = xml.xpath("//desc").content rescue nil
# xml.xpath("//Name").each do |node|
   # pp node.content
 #end