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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new # same as self.new
    song.name = song_name # instance of the song name
    song
  end

  def self.create_by_name(song_name)
    song = self.create # create new song and save
    song.name = song_name # assign the name to the song
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    unless song = self.find_by_name(song_name)
    song =self.create_by_name(song_name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(file_name)
    file_name = file_name.gsub(".mp3","").split(" - ")
    song_name = file_name[1]
    song = self.new
    song.name = song_name
    song.artist_name = file_name[0]
    song
  end

  def self.create_from_filename(file_name)
    file_name = file_name.gsub(".mp3","").split(" - ")
    song_name = file_name[1]
    song = self.create
    song.name = song_name
    song.artist_name = file_name[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

