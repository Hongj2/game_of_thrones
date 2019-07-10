require_relative './scraper'
class House
  attr_accessor :name,:url,:summary,:motto, :sigil
  @@all = []
  
def sigil
  @sigil
end

def sigil=(some_text)
  @sigil = some_text
end

def motto
  @motto
end

def motto=(some_text)
  @motto = some_text
end

def summary
  @summary
end

def summary=(some_text)
  @summary = some_text
end


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



