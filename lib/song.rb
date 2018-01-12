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

  def self.new_by_name(track)
    song = Song.new
    song.name = track
    song
  end

  def self.create_by_name(track)
    song = Song.new
    @@all << song
    song.name = track
    song
  end

  def self.find_by_name(song)
    @@all.find do |song_instance|
      song_instance.name == song
    end
  end

  def self.find_or_create_by_name(name)
    found_obj = Song.find_by_name(name)
    # binding.pry
      if found_obj != nil
        found_obj
      else
        self.create_by_name(name)
      end
  end

  def self.alphabetical
    @@all.sort_by do |song_instance|
      song_instance.name
    end
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    track = filename.split(" - ")[1].chomp(".mp3")
    song = Song.new
    song.artist_name = artist
    song.name = track
    song
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    track = filename.split(" - ")[1].chomp(".mp3")
    song = self.create
    song.name = track
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
