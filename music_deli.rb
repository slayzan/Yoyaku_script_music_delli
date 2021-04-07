require 'nokogiri'
require 'open-uri'
require_relative 'lib/release'
require_relative 'lib/builder'

begin
    file = File.read(ARGV[0])
rescue
    abort "please open .xml file"
end

xml = Nokogiri::XML(file)

#determine how many songs are in the release 
def nbSongs(xml)
    nbSongs = 0
    xml.xpath("//TrackNumber").each { |track| nbSongs = nbSongs + 1}
    return nbSongs
end

# create an array for each song, i is used if its the first time we meet the data in the xml else we use j
def createSongs(xml)
    release = Array.new
    i = 0
    j = 1
    j.upto(nbSongs(xml)) do |song|
        release[i] = Song.new(xml.xpath("//Name")[j].content, xml.xpath("//PrimaryArtists")[i].content, xml.xpath("//MainGenre")[i].content,
        xml.xpath("//Genre")[j].content,xml.xpath("//TrackNumber")[i].content, xml.xpath("//Catalog")[0].content,1.29) rescue nil
        j = j + 1
        i = i + 1
    end
    optionnalProtect(xml,release)
end

# Check if there is an optionnal data in some fields
def optionnalProtect(xml,release)
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
    build_xml(release,xml)
end

#get the price of a release
def fullPrice(release)
    totalPrice = 0
    release.each {|song| totalPrice = totalPrice + song.price}
    return totalPrice
end

#construct the string for playlist_data_track
def buildDataTrack(release,file)
    data = ""
    release.each do |song| 
        data = song.feat_artist ? data + "<a href=\"http:\/\/player.yoyaku.io/mp3/#{file.xpath("//Catalog")[0].content}_#{song.track_number}.mp3>#{song.artists} & #{song.feat_artist} - #{song.name}</a>\n" : data + "<a href=\"http:\/\/player.yoyaku.io/mp3/#{file.xpath("//Catalog")[0].content}_#{song.track_number}.mp3>#{song.artists} - #{song.name}</a>\n"
    end
    return data
end

createSongs(xml)