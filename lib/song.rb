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
new_song = Song.new
new_song.save
new_song
  end

  def self.new_by_name(string)
    new_song_by_name = self.create
    new_song_by_name.name = string
new_song_by_name
  end

def self.create_by_name(name)
created = self.create
created.name = name
created
end

def self.find_by_name(name)
@@all.find {|song| song.name == name}
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
    self.create_by_name(name)
  else
    self.find_by_name(name)
  end
end

def self.alphabetical
sorted = @@all.sort_by {|song| song.name}
sorted
end

def self.new_from_filename(name)
song = self.new
song.name = name.split('-')[1].strip.split(".mp3").join
song.artist_name = name.split('-')[0].strip
song
end

def self.create_from_filename(name)
  # could probably have created a helper method for both create/new fromfilename
  
  song = self.new
  song.name = name.split('-')[1].strip.split(".mp3").join
  song.artist_name = name.split('-')[0].strip
  @@all << song
  song
end

def self.destroy_all
  @@all.clear
end


##########
end#######
