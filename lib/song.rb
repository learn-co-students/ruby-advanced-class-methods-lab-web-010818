require 'pry'
class Song
 attr_accessor :name, :artist_name

 @@all = []

 def self.all
   @@all
 end

 def save
   self.class.all << self
 end

 def self.create
   self.new
 end

 def initialize(name=nil)
   @name = name
   @@all << self
 end

 def self.new_by_name(name)
   self.new(name)
 end

 def self.create_by_name(name)
   self.new(name)
 end

 def self.find_by_name(title)
   @@all.find do |song|
     song.name == title
   end
 end

 def self.find_or_create_by_name(title)
   if self.find_by_name(title)
     self.find_by_name(title)
   else
     self.create_by_name(title)
   end

 end

 def self.alphabetical
    @@all.sort_by! do |s|
      s.name
    end
  end

def self.new_from_filename(song1)
  song = Song.new
  songArr = song1.split(" - ")
  songName = songArr[1].split(".")
  #song.mp3 :: songName is split at the . index 0 is the song. index 1 is 'mp3'
  song.artist_name = songArr[0]
  song.name = songName[0]
  song
end

def self.create_from_filename(song1)
  self.new_from_filename(song1)
  self
end

def self.destroy_all
  @@all.clear
end

end
