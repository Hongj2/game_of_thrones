require 'nokogiri'
require 'colorize'

class GOT
  
  def run
    welcome
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
    puts"     |     \/      vvvvvvvvvvvvvvvvv     \/    |".bold
    puts"     |                  +++++                  |".bold
    puts"     |                _/     \_                |".bold
    puts"     |               _|   O   |_               |".bold
    puts"     |               _|  ooo  |_               |".bold
    puts"     |mmmmmmmmmmmmmmmm|       |mmmmmmmmmmmmmmmm|".bold
    puts ""
    puts "                    W E L C O M E                  ".bold
    puts "         TO THE BOOK ABOUT THE GREAT HOUSES        ".bold
    puts "                     OF WESTEROS                    ".bold
    puts ""
    puts "To see the list of the great houses of Westeros, type: " + "list".bold 
    puts "To see the information of all the houses of Westeros, type: " + "all".bold
  end 
  
 def list_of_house
    input=gets.strip
    if input== "list"
      list = Scraper.house.text.split("House")
      list.each_with_index{|house,index| puts "[#{index+1}] #{house}"}
     elsif input == "exit"
    system "clear" or sys "cls"
    exit
  else
    puts "The Lord Command Snow knows nothing of this order...Try again".bold
    
  end
    
end

  def general_info
    input=gets.strip
    if input == "all"
      all = Scraper.house.text.split("\n")
      all.each_with_index{|house,index| puts "[#{index+1}] #{house}"}
    elsif input == "exit"
    system "clear"
    exit
  else
    puts "The Lord Command Snow knows nothing of this order...Try again".bold
    
  end
end
 



end

