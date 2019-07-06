require_relative './scraper'

class Houses
  attr_accessor :name, :sigil, :motto, :wiki
@@all = []

def initialize(name,wiki,sigil)
  @name = name
  @wiki = wiki 
  @sigil= sigil
  @@all << self 
end


def self.all
    @@all
end

end
