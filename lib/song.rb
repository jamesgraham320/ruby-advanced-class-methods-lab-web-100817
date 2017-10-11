class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    instance = allocate
    instance.send(:initialize)
    @@all << instance
    instance
  end

  def self.new_by_name(name)
    instance = allocate
    instance.send(:initialize, name)
    instance
  end

  def self.create_by_name(name)
    instance = allocate
    instance.send(:initialize, name)
    @@all << instance
    instance
  end

  def initialize(name="")
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(string)
    words = string.split(" - ")
    instance = self.new_by_name(words[1].chomp".mp3")
    instance.artist_name = words[0]
    instance

  end


  def self.create_from_filename(string)
    words = string.split(" - ")
    instance = self.create_by_name(words[1].chomp".mp3")
    instance.artist_name = words[0]
    instance
  end

  def self.destroy_all
    @@all.clear
  end

end
