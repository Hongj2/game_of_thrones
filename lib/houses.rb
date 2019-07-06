class Houses
  @@all = []
  
  attr_accessible :name, :information, :sigil, :motto, :wiki


def initialize(name,wiki)
  @name = name
  @wiki = wiki 
  @@all << self 
end

def self.all
    @@all
end

end
