require "pry"

# class Song
#   attr_accessor :name, :artist_name
#   @@all = []

#   def initialize(name, artist_name = nil)
#     @name = name
#     @artist_name = artist_name
#   end

#   def self.create
#     new_song = Song.new(name)
#     @@all <<  new_song
#     new_song
#   end

#   def self.new_by_name(name)
#     name = Song.new(name)
#   end

#   def self.create_by_name(name)
#     song = Song.new(name)
#     @@all << song
#     song
#   end

#   def self.find_by_name(name)
#     song = @@all.find do |song_instance|
#       song_instance.name == name
#     end
#     song
#   end

#   def self.find_or_create_by_name(name)
#     if find_by_name(name)
#       find_by_name(name)
#     else
#       create_by_name(name)
#     end
#   end

#   def self.alphabetical
#     sorted = @@all.sort do |song1, song2|
#     song1.name <=> song2.name
#     end
#     sorted

#     # sorted = @@all.sort_by do |song|  #here's another way using sort_by
#     #   song.name
#     # end
#     # sorted
#   end

#   def self.new_from_filename(filename)
#     artist = filename.split(" - ")[0]
#     song = filename.split(" - ")[1][0...-4]
    
#     Song.new(song, artist)
#   end

#   def self.create_from_filename(filename)
#     artist = filename.split(" - ")[0]
#     song = filename.split(" - ")[1][0...-4]
    
#     @@all << Song.new(song, artist)
#   end

#   def self.destroy_all
#     @@all = []
#   end

#   def self.all
#     @@all
#   end

#   def save
#     self.class.all << self
#   end
 
# end

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
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort do |song1, song2|
      song1.name <=> song2.name
    end
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1][0...-4]
    new_song = self.new
    new_song.name, new_song.artist_name = song, artist
    new_song
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1][0...-4]
    new_song = self.create
    new_song.name, new_song.artist_name = song, artist
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end

