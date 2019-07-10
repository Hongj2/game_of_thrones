require 'nokogiri'
require 'colorize'
require 'open-uri'
require_relative './houses'
require 'pry'

class GOT
 
  def run
    Scraper.scraper_gen_info
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
    puts "To see the information of all the houses of Westeros, type: " + "[general]".red.bold
    puts ""
  end 


def get_house_detail(input)
  input=input.to_i
    if (1..House.all.length).to_a.include?(input)
    selected_house = House.all[input -1]
      Scraper.general_information(selected_house)
       puts selected_house.sigil
    end
end


def orders
 input= gets.strip
    if input == "list"
      list_of_house
    elsif input == "general"
      general_info
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
    
  puts ""
   input= gets.strip
    if input == "welcome"
      run
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


      
def list_of_house
  puts ""
  puts "This is the list of Great Houses of Westeros".blue.bold
  puts ""
House.all.each_with_index {|house,index| puts "[#{index+1}] #{house.name}"}
  puts ""
  puts "To see the general information about a house, type numbers:" "[1-20]".blue.bold 
  puts "To see menu type:" "[menu]".blue.bold 
  puts ""
     
  input= gets.strip
  get_house_detail(input)
  
    #if input.to_i.to_s == input
    
      # puts ""
      # puts "To see menu type:" "[menu]".blue.bold 
      # puts "to return back to the list of houses types:" "[list]".blue.bold 
      # puts ""
      #     input= gets.strip
      #       if input == "list"
      #           list_of_house
      #       elsif input == 'menu'
      #           pathways
      #       else 
      #         puts "The Lord Command Snow knows nothing...Try again".blue.bold
      #         puts ""
      #           pathways
      #       end
     #elsif input == "menu"
         pathways
    # end
end




 

  
  

end

