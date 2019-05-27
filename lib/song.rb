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
  newSong = self.new
  @@all << newSong
  newSong
# newSong variable saves self.new as same object.
# new represents .initialize :: creats new Song object
end

def self.new_by_name(name)
  newSong = self.new
  newSong.name = name
  newSong
  # .name is 'undefined' if newSong is not returned
end

def self.create_by_name(title)
  newSong = self.create
  newSong.name = title
  newSong
  #line 31 creates new instance and pushes a new song to @@all[]
  #line 32 sets the name (.name acts as setter method) to title variable
  #line 33 returns the new song create w/ the name of title
end

def self.find_by_name(songName)
  @@all.find do |song|
    song.name == songName
  end
  #s.name is calling the name method on the 's' to see if the value == songName
end

def self.find_or_create_by_name(songName)

    if self.find_by_name(songName)
      self.find_by_name(songName)
    else
      self.create_by_name(songName)
    end
end

def self.alphabetical
  @@all.sort_by do |song|
    song.name
  end
end

def self.new_from_filename(song1)
  newSong = self.create
  songArr = song1.split(" - ")
  newSongArr = songArr[1].split(".")
  newSong.name = newSongArr[0]
  newSong.artist_name = songArr[0]
  newSong
  #again. new song must be created!
  #test fails if created song(newSong) is not returned
end

def self.create_from_filename(newSong)
  self.new_from_filename(newSong)

end

def self.destroy_all
  @@all.clear
end

end


#  def self.create
#    self.new
#  end
#
#  def initialize(name=nil)
#    @name = name
#    @@all << self
#  end
#
#  def self.new_by_name(name)
#    self.new(name)
#  end
#
#  def self.create_by_name(name)
#    self.new_by_name(name)
#
#  end
#   # binding.pry
#
#  def self.find_by_name(title)
#    @@all.find do |song|
#      song.name == title
#    end
#  end
#
#  def self.find_or_create_by_name(title)
#    if self.find_by_name(title)
#      self.find_by_name(title)
#    else
#      self.create_by_name(title)
#    end
#
#  end
#
#  def self.alphabetical
#     @@all.sort_by! do |s|
#       s.name
#     end
#   end
#
# def self.new_from_filename(song1)
#   song = Song.new
#   songArr = song1.split(" - ")
#   songName = songArr[1].split(".")
#   #song.mp3 :: songName is split at the . index 0 is the song. index 1 is 'mp3'
#   song.artist_name = songArr[0]
#   song.name = songName[0]
#   song
# end
#
# def self.create_from_filename(song1)
#   self.new_from_filename(song1)
#   self
# end
#
# def self.destroy_all
#   @@all.clear
# end
#
# end
