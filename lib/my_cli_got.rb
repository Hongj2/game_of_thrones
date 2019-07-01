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
    puts"       |>      |>                     |>      |>".bold
    puts"       |_-___-_|                      |_-___-_|".bold
    puts"        |vvvvv|                        |vvvvv|".bold
    puts"       |__[[]]_|                      |_[[]]__|".bold
    puts"      |   |**|  |_-_-_-_-_-_-_-_-_-_-_| |**|  |".bold
    puts"     |    |  |   vvvvvvvvvvvvvvvvvvvvv  |  |   |".bold
    puts"     |    |XX|          GAME OF         |XX|   |".bold
    puts"     |    |()|          THRONES         |()|   |".bold
    puts"     |     V      vvvvvvvvvvvvvvvvv       V    |".bold
    puts"     |                  +++++                  |".bold
    puts"     |                _b     d_                |".bold
    puts"     |               _|   O   |_               |".bold
    puts"     |               _|  ooo  |_               |".bold
    puts"     |mmmmmmmmmmmmmmmm|       |mmmmmmmmmmmmmmmm|".bold
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
  end
  
  
  def pathways
    puts ""
    puts "To exit type: [exit]"
    puts "To return back to the main page type: [welcome]"
    puts "To see the list of the great houses of Westeros, type: " + "[list]".red.bold 
    puts "To see the information of all the houses of Westeros, type: " + "[all]".red.bold
    puts "To see the mottos of all the houses of Westeros, type: " + "[motto]".red.bold      
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
      pathways
    end
  
  end

  def general_info
    puts ""
    Scraper.scraper_gen_info

     pathways
  end
      

  
  
 def list_of_house
     puts ""
     Scraper.scraper_house_list
     puts ""
     puts "To see the general information about a house, type number [1-20]"
     puts "To see menu type [menu]"
     
      input= gets.strip
     if input.to_i.to_s == input
        #Scraper.scraper_sp_info["#{input}"]
         puts ""
         puts "To see the wiki page link type: [geek out]"
         puts "to return back to the list of houses types: [list]"
         puts "To see the general information about another house, type number [1-20]"
        
               input= gets.strip
                 if input.to_i.to_s == input
                     puts "should list a specific house information #{input} [NEEDS A METHOD [y] !!]"
                 elsif input == "geek out"
                     puts "[PUTS WIKI PAGE LINK METHOD]"
                 elsif  input == "list"
                    list_of_house
                 else 
                      puts "The Lord Command Snow knows nothing...Try again".blue.bold
                  end
                  pathways
     elsif input == "menu"
         pathways
     end
    
 end




 
  def mottos
     puts "[PUTS MOTTOS METHOD TO OUTPUT A LIST WITH INDEX NUMBER !!] "
     puts ""
     puts "To see the general information about a house, type number [1-20]"
     puts "To see menu type [menu]"
     
      input= gets.strip
      if input.to_i.to_s == input
         puts "should list a specific house information #{input} [NEEDS A METHODX [y] !!]"
         puts ""
         puts "To see the wiki page link type: [geek out]"
         puts "To return back to the list of mottos types: [mottos]"
    
               input= gets.strip
                 if input == "mottos"
                      mottos
                 elsif input == "geek out"
                      puts "[PUTS WIKI PAGE LINK METHOD!!]"
                 else 
                      puts "The Lord Command Snow knows nothing...Try again".blue.bold
                    pathways
                  end
                  
     elsif input == "menu"
         pathways
     end
    
 end
  
  
 
  def sigils
     puts "[PUTS SIGILS METHOD TO OUTPUT A LIST WITH INDEX NUMBER !!] "
     puts ""
     puts "To see the general information about a house, type number [1-20]"
     puts "To see menu type [menu]"
     
      input= gets.strip
      if input.to_i.to_s == input
         puts "should list a specific house information #{input} [NEEDS A METHODX [y] !!]"
         puts ""
         puts "To see the wiki page link type: [geek out]"
         puts "To return back to the list of sigils, types: [sigils]"
    
               input= gets.strip
                 if input == "sigils"
                      sigils
                 elsif input == "geek out"
                      puts "[PUTS WIKI PAGE LINK METHOD!!]"
                 else 
                      puts "The Lord Command Snow knows nothing...Try again".blue.bold
                    pathways
                  end
                  
     elsif input == "menu"
         pathways
     end
    
 end
  
  


end

