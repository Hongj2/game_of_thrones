require_relative './scraper'
class House
  attr_accessor :name,:url,:summary,:motto,:sigil
  @@all = []

def initialize(name,url)
  @name=name
  @url=url 
  @@all << self 
end

def self.create(house_array)
   house_array.each{|house| House.new(house)}
end
 
def self.all
    @@all
end


end
