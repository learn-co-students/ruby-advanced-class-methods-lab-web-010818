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

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
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

  def self.new_from_filename(filename)
    without_extension = filename.slice(0..-5)
    song_artist_array = without_extension.split(" - ")
    self.new(song_artist_array[1], song_artist_array[0])
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end






end
