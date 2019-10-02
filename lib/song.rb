class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    if (self.artist.nil?)
     Artist.find_or_create_by_name(name)
    else
     self.artist.name = name
    end
    self.artist.add_song(name)
  end

  def self.new_by_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    #Pending artist_name=() completion
    song = self.new(song_name)
    song.artist.name(artist_name)
    #Pending artist_name=() completion
  end

end
