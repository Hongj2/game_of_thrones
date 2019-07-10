require 'nokogiri'
require 'open-uri'
require_relative './houses'
require 'pry'
class Scraper

BASE_URL = 'https://gameofthrones.fandom.com/wiki/Great_House'

def self.scraper_gen_info
  page = Nokogiri::HTML(open(BASE_URL)) 
  general_info = page.css('div#mw-content-text ul')[0..2].css('b a').each {|houses|
    name= houses.text
    url= "https://gameofthrones.fandom.com#{houses.attribute('href').value}" 
  House.create(name,url)}
  end
  
#instantiate new House objects with name and url

def self.scrape_lvl1 
html = Nokogiri::HTML(open(BASE_URL)) 
  pages = html.css('b a').each {|houses|
    name= houses.text
    url= "https://gameofthrones.fandom.com#{houses.attribute('href').value}" 
  House.create(name,url)}
end

# after 2nd lvl scrape update house objects
#house_obj.sigil = page.css("sigil selector")

def self.general_information(house_obj)
gen_info= {}
html = Nokogiri::HTML(open("#{house_obj.url}"))
      house_obj.summary= html.css('div#mw-content-text>p').first.text
      house_obj.motto= html.css('aside div.pi-data-value>a')[1].text
      house_obj.sigil= html.css("div.pi-item>div").first.text 
house_obj

end
 

end #final end
 
 
 
