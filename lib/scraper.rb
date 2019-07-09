require 'nokogiri'
require 'open-uri'
require_relative './houses'
class Scraper

BASE_URL = 'https://gameofthrones.fandom.com/wiki/Great_House'

  def self.scraper_gen_info
    page = Nokogiri::HTML(open(BASE_URL)) 
    general_info = page.css('div#mw-content-text ul').text.split("\n")
    general_info.each_with_index {|house,index| 
    puts "[#{index +1}] #{house}" 
    puts ""}.map
  end
  
  def self.scraper_house_list
     page = Nokogiri::HTML(open(BASE_URL)) 
    house_names= page.css('div#mw-content-text').first.css("li>b").text.split("House")
    house_names.each_with_index {|house,index| puts "[#{index+1}] #{house}"}
end

def self.scraper_house_wiki
  page = Nokogiri::HTML(open(BASE_URL))
  house_hash=[]
  results= page.css('b a').each {|house|
    hash= {
      house_name: house.text,
      wiki: house.attribute('href').value,
      sigil: Nokogiri::HTML(open("https://gameofthrones.fandom.com#{wiki}")).css("div.pi-item>div").first.text
    }
      house_hash << hash
 Houses.new(house_name,wiki,sigil)
 }
house_hash
end

def self.tester
  page = Nokogiri::HTML(open(BASE_URL))
  house_name =[]
  wiki = []
  results= page.css('b a').each {|house|
  house_name<< house.text
  wiki<< "https://gameofthrones.fandom.com#{house.attribute('href').value}" 
}
#puts wiki
#puts house_name
end

end #final end

