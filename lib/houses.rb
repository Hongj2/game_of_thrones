require_relative './scraper'
class House
  attr_accessor :name,:url,:summary,:motto, :sigil
  @@all = []
  
def initialize(name,url)
  @name=name
  @url=url 
end

def save
    self.class.all << self
end

def self.create(name,url)
    house = House.new(name,url)
    house.save
    house
end
 
def self.all
    @@all
end

end



