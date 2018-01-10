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
    new=self.new
    @@all<<new
    new
  end

  def self.new_by_name(name)
    new=self.new
    new.name=name
    new
  end

  def self.create_by_name(new_song)
    new=self.new
    new.name=new_song
    @@all<<new
    new
  end

  def self.find_by_name(input)
    @@all.find do |song|
      song.name == input
    end
  end

  def self.find_or_create_by_name(input)
    song_finder=self.find_by_name(input)
    if song_finder
      song_finder
    else
      self.create_by_name(input)
    end
  end

  def self.alphabetical
    list=@@all.sort_by{|song| song.name.downcase}
    list
  end

  def self.new_from_filename(filename)
    name=filename.split(".")[0]
    info=name.split(" - ")
    new_song=self.new
    new_song.name=info[1]
    new_song.artist_name=info[0]
    new_song
  end

  def self.create_from_filename(filename)
   @@all << new_from_filename(filename)
 end

  def self.destroy_all
    @@all=[]
  end

end
