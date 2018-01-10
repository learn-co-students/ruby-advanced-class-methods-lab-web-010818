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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def Song.alphabetical
      self.all.sort_by { |a| a.name}
  end

  def self.new_from_filename(str)
    title = str.split(" - ")
    title[1].slice!((-4..-1))
    song = self.new_by_name(title[1])
    song.artist_name = title[0]
    song
end

  def self.create_from_filename(str)
    title = str.split(" - ")
    title[1].slice!((-4..-1))
    song = self.new_by_name(title[1])
    song.artist_name = title[0]
    song
  end

  def self.destroy_all
    @@all = []
    @@all
  end

end
