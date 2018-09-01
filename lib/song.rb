require "pry"

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
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      if song_name == song.name
        true
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    pieces = file_name.split(" - ")
    song = create_by_name(pieces[1][0...-4])
    song.artist_name = pieces[0]
    song
  end

  def self.create_from_filename(file_name)
    pieces = file_name.split(" - ")
    song = create_by_name(pieces[1][0...-4])
    song.artist_name = pieces[0]
    self.all << song
    song
  end

  def self.destroy_all
    @@all = []
  end
end
