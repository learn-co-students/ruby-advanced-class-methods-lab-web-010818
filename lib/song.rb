require "pry"

class Song
  attr_accessor :name, :artist_name, :new_by_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = "")
    @name = name
  end


  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split = filename.split(/\s-\s|\./)
    song = self.new_by_name(split[1])
    song.artist_name = split[0]
    song
  end

  def self.create_from_filename(filename)
    split = filename.split(/\s-\s|\./)
    song = self.create_by_name(split[1])
    song.artist_name = split[0]
    song
  end

  def self.destroy_all
    @@all = []
  end

end
