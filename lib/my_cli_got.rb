require 'nokogiri'
require 'colorize'
require 'open-uri'
require_relative './houses'

class GOT
 BASE_URL = 'https://gameofthrones.fandom.com/wiki/Great_House'
 
  def run
    welcome
    orders
  end

def create_house 
house_array = Scraper.scrape_lvl1
    House.create(house_array)
end

  def welcome
    puts ""
    puts"       |>      |>                     |>      |>".blue.bold
    puts"       |_-___-_|                      |_-___-_|".blue.bold
    puts"        |vvvvv|                        |vvvvv|".blue.bold
    puts"       |__[[]]_|                      |_[[]]__|".blue.bold
    puts"      |   |**|  |_-_-_-_-_-_-_-_-_-_-_| |**|  |".blue.bold
    puts"     |    |  |   vvvvvvvvvvvvvvvvvvvvv  |  |   |".blue.bold
    puts"     |    |XX|          GAME OF         |XX|   |".blue.bold
    puts"     |    |()|          THRONES         |()|   |".blue.bold
    puts"     |     V      vvvvvvvvvvvvvvvvv       V    |".blue.bold
    puts"     |                  +++++                  |".blue.bold
    puts"     |                _b     d_                |".blue.bold
    puts"     |               _|   O   |_               |".blue.bold
    puts"     |               _|  ooo  |_               |".blue.bold
    puts"     |mmmmmmmmmmmmmmmm|       |mmmmmmmmmmmmmmmm|".blue.bold
    puts ""
    puts "                    W E L C O M E                  ".bold
    puts "         TO THE BOOK ABOUT THE GREAT HOUSES        ".bold
    puts "                     OF WESTEROS                    ".bold
    puts ""
    puts "To see the list of the great houses of Westeros, type: " + "[list]".red.bold 
    puts "To see the information of all the houses of Westeros, type: " + "[general]".red.bold
    #puts "To see the mottos of all the houses of Westeros, type: " + "[motto]".red.bold
    #puts "To see the sigils of all the houses of Westeros, type: " + "[sigil]".red.bold
    puts ""
  end 



  def tester
  #input= gets.strip
  Scraper.general_information
  exit
end

  def orders
   input= gets.strip
    if input == "list"
      list_of_house
    elsif input == "general"
      general_info
    elsif  input == "motto"
      motto
    elsif input == "sigil"
      sigil
    elsif  input == "menu"
      pathways
    elsif input == "tester"
    tester
    else 
      puts "The Lord Command Snow knows nothing...Try again".blue.bold
    end
    orders
  end
  
  
  def pathways
    puts ""
    puts "To exit type: " + "[exit]".red.bold    
    puts "To return back to the main page type: " + "[welcome]".red.bold    
    puts "To see the list of the great houses of Westeros, type: " + "[list]".red.bold 
    puts "To see the information of all the houses of Westeros, type: " + "[general]".red.bold
    #puts "To see the mottos of all the houses of Westeros, type: " + "[motto]".red.bold    
    # puts "To see the sigils of all the houses of Westeros, type: " + "[sigil]".red.bold
    puts ""
     input= gets.strip
    if input == "welcome"
      run
    elsif  input == "motto"
      motto
    elsif input == "list"
      list_of_house
    elsif input == "general"
      general_info
    elsif input == "exit"
     exit
    else 
      puts "The Lord Command Snow knows nothing...Try again".blue.bold
      puts ""
      pathways
    end
  end

  

 def general_info
  puts ""
   puts "This is the list of general information about the Great Houses of Westeros"
  puts ""
   Scraper.scraper_gen_info

     pathways
  end
      

  
  
 def list_of_house
     puts ""
     puts "This is the list of Great Houses of Westeros".blue.bold
     puts ""
     Scraper.scraper_house_list
     puts ""
     puts "To see the general information about a house, type number [1-20]"
     puts "To see menu type [menu]"
     puts ""
     
      input= gets.strip
      if input.to_i.to_s == input
        ## using House.all find the corresponding house instance
        #select_house = House.all[input]
        #Scraper.gen(select_house)
       Scraper.gen(input.to_i)
         puts ""
         puts "To see menu type [menu]"
         puts "to return back to the list of houses types: [list]"
         puts ""
        
               input= gets.strip
                 if input == "list"
                    list_of_house
                  elsif input == 'menu'
                  pathways
                 else 
                      puts "The Lord Command Snow knows nothing...Try again".blue.bold
                      puts ""
                  pathways
                  end
     elsif input == "menu"
         pathways
     end
    
 end




 
  #def mottos
  #   puts ""
  #   puts "This is a list of mottos of the Great Houses of Westeros".blue.bold
  #   puts ""
  #   puts "[PUTS MOTTOS METHOD TO OUTPUT A LIST WITH INDEX NUMBER !!] "
  #   puts ""
  #   puts "To see the general information about a house, type number [1-20]"
  #   puts "To see menu type [menu]"
  #  puts ""
     
  #     input= gets.strip
  #    if input.to_i.to_s == input
  #     Scraper.gen(input.to_i)
  #       puts ""
  #      puts "To return back to the list of mottos types: [mottos]"
  #       puts "To see menu type [menu]"
  #       puts ""
    
  #             input= gets.strip
  #               if input == "mottos"
  #                    mottos
  #                    
  #                  elsif input == 'menu'
  #                pathways
  #               else 
  #                    puts "The Lord Command Snow knows nothing...Try again".blue.bold
  #                    puts ""
  #                  pathways
  #                end
                  
  #   elsif input == "menu"
  #       pathways
  #   end
    
 #end
 
#  def sigil
#     puts ""
#     puts "This is a list of sigils of the Great Houses of Westeros".blue.bold
#     puts ""
#     Scraper.scraper_house_wiki
#     puts ""
#     puts "To see the general information about a house, type number [1-20]"
#     puts "To see menu type [menu]"
#     puts ""
     
      
#      input= gets.strip
#      if input.to_i.to_s == input
#       Scraper.gen(input.to_i)
#         puts ""
#         puts "To return back to the list of sigils, types: [sigils]"
#         puts "To see menu type [menu]"
#         puts ""
    
 #              input= gets.strip
#                 if input == "sigil"
 #                     sigil
#                  elsif input == "menu"
#                 pathways
#                 else 
#                      puts "The Lord Command Snow knows nothing...Try again".blue.bold
#                      puts ""
#                    pathways
#                  end
                  
#     elsif input == "menu"
#         pathways
#     
#     end

 #end
  
  

end

