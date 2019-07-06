require 'nokogiri'
require 'open-uri'
class Scraper

BASE_URL = 'https://gameofthrones.fandom.com/wiki/Great_House'

  def self.scraper_gen_info
    page = Nokogiri::HTML(open(BASE_URL)) 
    general_info = page.css('ul b').text.split("House")
    general_info.each_with_index {|house,index| puts "[#{index +1}] #{house}"}.map
  end
  
#  def self.scraper_sp_info
#    puts self.scraper_gen_info
#  end

  def self.scraper_house_list
     page = Nokogiri::HTML(open(BASE_URL)) 
    house_names= page.css('div#mw-content-text').first.css("li>b").text.split("House")
    house_names.each_with_index {|house,index| puts "[#{index+1}] #{house}"}
end

def self.scraper_house_wiki
  page = Nokogiri::HTML(open(BASE_URL))
  results= page.css('b a').each {|house|
 house_name= house.text
 wiki= house.attribute('href').value
 House.new(house_name,wiki)
 }
end

end #final end

