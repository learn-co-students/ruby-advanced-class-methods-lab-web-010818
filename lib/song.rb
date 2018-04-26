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
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) ? Song.find_by_name(name) : Song.create_by_name(name)
  end


  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)

    split_name = file.split(" - ")
    name = split_name[1]
    artist_name = split_name[0]
    name = name.slice(0, name.length - 4)

    song = Song.create_by_name(name)
    song.artist_name = artist_name

    song
  end

  def self.create_from_filename(file)
    Song.new_from_filename(file).save
  end

  def self.destroy_all
    @@all = []
  end

end
