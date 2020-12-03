class Song
  attr_accessor :name, :artist_name
  @@all = []

    

 
  def self.all
    @@all
  end
  def self.create  #class constructor
     song = self.new
     #song.save
     self.all << song
     song
  end 
  def self.new_by_name(name)
     song  = self.new
     song.name = name
     song
  end 
  def self.create_by_name(name)
        song = self.create
        song.name = name
        song
  end

  def self.find_by_name(name)
      name = self.all.detect {|song| song.name == name}
      name
  end
  def self.find_or_create_by_name(name)
      result = self.find_by_name(name)
      if result
        result
      else
        self.create_by_name(name)
      end
  end
    def self.alphabetical
     name = self.all.sort_by {|song| song.name}
     name
    end

    def self.new_from_filename(filename)
      row = filename
      data = row.split(" - ")
      artist_name = data[0]
      song_name = data[1].gsub(".mp3", "")
      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song

    end
def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save
  song

end

def self.create_by_name(name)
  song = self.create
  song.name = name
  song

end
def self.find_by_name(name)
  @@all.find do |song|
    if song.name == name
      return song
    end
  end

end
def self.destroy_all
  @@all.clear

end

  def save
    self.class.all << self
  end

end
