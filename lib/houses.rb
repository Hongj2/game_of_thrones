require_relative './scraper'

class House
  attr_accessor :name, :sigil, :motto, :wiki
@@all = []

def initialize(name,wiki,sigil)
  @name = name
  @wiki = wiki 
  @sigil= sigil
  @@all << self 
end
# need to a create method

def self.all
    @@all
end

end
