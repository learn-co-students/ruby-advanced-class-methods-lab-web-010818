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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(string)
    song = Song.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = Song.new
    song.name = string
    @@all << song
    song
  end

  def self.find_by_name(string)
    @@all.find {|song| song.name == string}
  end


  def self.find_or_create_by_name(string)
    if self.find_by_name(string)
      self.find_by_name(string)
    else
      self.create_by_name(string)
    end
  end

  def self.alphabetical

    @@all.sort_by do |elem|
      elem.name
    end
  end

  def self.new_from_filename(string)
    array = string.split(' - ')

    song = Song.new
    array1 = array[1].split(".")

    song.name = array1[0]
    song.artist_name = array[0]

    song
  end

  def self.create_from_filename(string)
    @@all << self.new_from_filename(string)
    self.new_from_filename(string)
  end

  def self.destroy_all
    @@all = []
  end

end
