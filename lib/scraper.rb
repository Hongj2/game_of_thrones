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
  wiki= []
  sigil= []
  results= page.css('b a').each {|house|
  wiki<< "https://gameofthrones.fandom.com#{house.attribute('href').value}" 
  sigil<< Nokogiri::HTML(open("https://gameofthrones.fandom.com#{house.attribute('href').value}")).css("div.pi-item>div").first.text 
}
 sigil.each_with_index {|s,index| puts "[#{index+1}] #{s}"}
end

def self.gen(num)
  page = Nokogiri::HTML(open(BASE_URL))
  house_name= []
  wiki= []
  sigil= []
  gen_info = []
  motto=[]
  results= page.css('b a').each {|house|
  
  house_name<< house.text
  wiki<< "https://gameofthrones.fandom.com#{house.attribute('href').value}" 
  gen_info<< Nokogiri::HTML(open("https://gameofthrones.fandom.com#{house.attribute('href').value}")).css('div#mw-content-text>p').first.text
  motto<< Nokogiri::HTML(open("https://gameofthrones.fandom.com#{house.attribute('href').value}")).css('aside div.pi-data-value>a')[1].text
  sigil<< Nokogiri::HTML(open("https://gameofthrones.fandom.com#{house.attribute('href').value}")).css("div.pi-item>div").first.text 
  
}

puts ""
puts house_name[num -1]
puts ""
puts "Motto:"+ motto[num -1]
puts "Sigil:"+ sigil[num -1]
puts ""
puts gen_info[num -1]
puts ""
puts "Wikipage link:" + wiki[num -1]

end

end #final end

