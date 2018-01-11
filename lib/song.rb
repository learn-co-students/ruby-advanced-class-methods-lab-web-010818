require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    x = Song.new
    @@all << x
    x
  end

  def self.new_by_name(new_song)
    changed_song = Song.new
    changed_song.name = new_song
    changed_song
  end

  def self.create_by_name(variable)
    changed_song = Song.new
    changed_song.name = variable
    @@all << changed_song
    changed_song
  end

  def self.find_by_name(var)

    @@all.find {|e| e.name == var}

  end

  def self.find_or_create_by_name(arg)
    if self.find_by_name(arg)
  self.find_by_name(arg)
    else
  self.create_by_name(arg)
end
end

def self.alphabetical
  @@all.sort_by {|a| a.name}

end

def self.new_from_filename(argument)
  artist_and_song_name = argument.split(" - ")
  artist = artist_and_song_name[0]
  song_name = artist_and_song_name[1].sub(".mp3", "")
  #@name = song_name
  song = Song.new
  song.name = song_name
  song.artist_name = artist
  song

end

def self.create_from_filename(arg)
  #song = self.new_from_filename(arg)

  artist_and_song_name = arg.split(" - ")
  artist = artist_and_song_name[0]
  song_name = artist_and_song_name[1].sub(".mp3", "")
  #@name = song_name

  song = self.create_by_name(song_name)
  song.artist_name = artist
  song

end


  def self.destroy_all
    @@all = []
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
