class Houses
  @@all = []
  
  attr_accessible :house, :information, :sigil, :motto
  
def self.all
    @@all
end

def initialize(house,information,sigil=nil, motto=nil )
  @house = house
  @information = information
  self.sigil = sigil if sigil
  self.motto = motto if motto
  self.class.all << self
end

end
