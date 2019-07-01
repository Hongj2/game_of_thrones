require 'nokogiri'
require 'open-uri'
class Scraper

BASE_URL = 'https://gameofthrones.fandom.com/wiki/Great_House'
  
  def self.scraper_gen_info
    page = Nokogiri::HTML(open(BASE_URL)) 
    general_info = page.css('div#mw-content-text>ul').text.split("\n")
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

end

