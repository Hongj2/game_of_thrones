class Houses
  @@all = []
  
  attr_accessible :name, :information, :sigil, :motto
  
def self.all
    @@all
end

def initialize(house,information,sigil=nil, motto=nil )
  @house = house
  self.motto = motto if motto
  self.class.all << self
end

end
