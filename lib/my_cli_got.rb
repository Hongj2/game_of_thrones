require 'nokogiri'
require 'colorize'

class GOT
  
  def run
    welcome
    orders
  end
  
  #issue = currently it requires user to follow the run order.. if 'motto' was first, it does not reconize the motto method 
  
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
    puts "To see the list of the great houses of Westeros, type: " + "list".red.bold 
    puts "To see the information of all the houses of Westeros, type: " + "all".red.bold
   puts "To see the mottos of all the houses of Westeros, type: " + "motto".red.bold
  end 
  
  def orders
   input= gets.strip
    if input == "list"
      list_of_house
    elsif input == "all"
      general_info
    elsif  input == "motto"
      mottos
    else 
      puts "The Lord Command Snow knows nothing of this order...Try again".blue.bold
    end
  end
  
  
 def list_of_house
     puts "hi list"
     #list = Scraper.house.text.split("House")
      #list.each_with_index{|house,index| puts "[#{index+1}] #{house}"}
      
 end

  def general_info
   puts "hi all"
     # all = Scraper.house.text.split("\n")
     # all.each_with_index{|house,index| puts "[#{index+1}] #{house}"}

  end
 
  def mottos
     puts "hi motto"
     # all = Scraper.house.text.split("\n")
     # all.each_with_index{|house,index| puts "[#{index+1}] #{house}"}
   
  end


end

