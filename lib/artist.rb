class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def save
    self.class.all << self
  end

  def self.create_by_name(artist_name)
    artist = self.new(artist_name)
    artist
  end

  def self.find_by_name(artist_name)
    self.all.detect{|s| s.name == artist_name}
  end

  def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) || self.create_by_name(artist_name)
  end


end
