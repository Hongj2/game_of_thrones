require 'nokogiri'
require 'colorize'
require 'open-uri'


class GOT
  
  def run
    welcome
    orders
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
    puts "To see the information of all the houses of Westeros, type: " + "[all]".red.bold
    puts "To see the mottos of all the houses of Westeros, type: " + "[mottos]".red.bold
    puts "To see the sigils of all the houses of Westeros, type: " + "[sigils]".red.bold
    puts ""
  end 
  
  def orders
   input= gets.strip
    if input == "list"
      list_of_house
    elsif input == "all"
      general_info
    elsif  input == "mottos"
      mottos
    elsif input == "sigils"
      sigils
    elsif  input == "menu"
      pathways
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
    puts "To see the information of all the houses of Westeros, type: " + "[all]".red.bold
    puts "To see the mottos of all the houses of Westeros, type: " + "[motto]".red.bold      
    puts ""
     input= gets.strip
    if input == "welcome"
      run
    elsif  input == "mottos"
      mottos
    elsif input == "list"
      list_of_house
    elsif input == "all"
      general_info
    elsif  input == "motto"
      mottos
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
        #Scraper.scraper_sp_info["#{input}"]
         puts ""
         puts "To see the wiki page link type: [geek out]"
         puts "To see menu type [menu]"
         puts "to return back to the list of houses types: [list]"
         puts "To see the general information about another house, type number [1-20]"
         puts ""
        
               input= gets.strip
                 if input.to_i.to_s == input
                     puts "should list a specific house information #{input} [NEEDS A METHOD [y] !!]"
                 elsif input == "geek out"
                  
                    page = Nokogiri::HTML(open('https://gameofthrones.fandom.com/wiki/Great_House'))
                    page.css('ul b a').attribute('href').value
                     puts ""
                     
                 elsif  input == "list"
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




 
  def mottos
     puts ""
     puts "This is a list of mottos of the Great Houses of Westeros".blue.bold
     puts ""
     puts "[PUTS MOTTOS METHOD TO OUTPUT A LIST WITH INDEX NUMBER !!] "
     puts ""
     puts "To see the general information about a house, type number [1-20]"
     puts "To see menu type [menu]"
     puts ""
     
      input= gets.strip
      if input.to_i.to_s == input
         puts "should list a specific house information #{input} [NEEDS A METHODX [y] !!]"
         puts ""
         puts "To see the wiki page link type: [geek out]"
         puts "To return back to the list of mottos types: [mottos]"
         puts "To see menu type [menu]"
         puts ""
    
               input= gets.strip
                 if input == "mottos"
                      mottos
                 elsif input == "geek out"
                      self.scraper_house_wiki
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
  
  
 
  def sigils
     puts ""
     puts "This is a list of sigils of the Great Houses of Westeros".blue.bold
     puts ""
     puts "[PUTS SIGILS METHOD TO OUTPUT A LIST WITH INDEX NUMBER !!] "
     puts ""
     puts "To see the general information about a house, type number [1-20]"
     puts "To see menu type [menu]"
     puts ""
     
      input= gets.strip
      if input.to_i.to_s == input
         puts "should list a specific house information #{input} [NEEDS A METHODX [y] !!]"
         puts ""
         puts "To see the wiki page link type: [geek out]"
         puts "To return back to the list of sigils, types: [sigils]"
         puts "To see menu type [menu]"
         puts ""
    
               input= gets.strip
                 if input == "sigils"
                      sigils
                 elsif input == "geek out"
                      puts "[PUTS WIKI PAGE LINK METHOD!!]"
                      elsif input == "menu"
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
  
  


end

