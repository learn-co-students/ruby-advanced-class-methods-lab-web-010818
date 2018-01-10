require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
  end

  def self.create(name="",artist_name="")
    song = Song.new(name,artist_name)
    song.save
    song
  end

  def self.new_by_name(name="",artist_name="")
    song = Song.new(name, artist_name)
  end

  def self.create_by_name(name="",artist_name="")
    song = Song.new(name, artist_name)
    song.save
    song
  end

  def self.find_by_name(name="")
    @@all.find do |song|
      if name == song.name
        name
      end
    end
  end

  def self.find_or_create_by_name(name="")
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.new_from_filename(file_name)
    split = file_name.split(" - ")
    artist_name = split[0]
    name = split[1][0...-4]
    Song.new(name,artist_name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end


  def self.create_from_filename(file_name)
    split = file_name.split(" - ")
    artist_name = split[0]
    name = split[1][0...-4]
    self.create(name, artist_name)
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
