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
    song_instance = self.new
    song_instance.save
    song_instance
  end

  def self.new_by_name(song_name)
    song_instance = self.new
    song_instance.name = song_name
    song_instance
  end

  def self.create_by_name(song_name)
    song_instance = self.new_by_name(song_name)
    song_instance.save
    song_instance
  end

  def self.find_by_name(song_name)
    found = nil

    @@all.each do |song_instance|
      if song_instance.name == song_name
        found = song_instance
      end
    end

    found
  end

  def self.find_or_create_by_name(song_name)
    song_instance = self.find_by_name(song_name)

    if song_instance == nil
      song_instance = self.create_by_name(song_name)
    end

    song_instance
  end

  def self.alphabetical
    song_array = @@all.map do |song_instance|
      song_instance.name
    end

    sorted_song_instances = song_array.sort.map do |song_name|
      self.find_by_name(song_name)
    end

    sorted_song_instances
  end

  def self.new_from_filename(file_name)
    artist_and_song_array = file_name.split(" - ")
    song_instance = self.new_by_name(artist_and_song_array[1].split(".")[0])
    song_instance.artist_name = artist_and_song_array[0]
    song_instance
  end

  def self.create_from_filename(file_name)
    artist_and_song_array = file_name.split(" - ")
    song_instance = self.create_by_name(artist_and_song_array[1].split(".")[0])
    song_instance.artist_name = artist_and_song_array[0]
    song_instance
  end

  def self.destroy_all
    @@all = []
  end

end
