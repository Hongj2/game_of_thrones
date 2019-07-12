require 'nokogiri'
require 'colorize'
require 'open-uri'
require_relative './houses'


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
    puts "   What would you like to explore?"
    puts ""
    puts "To see the list of the great houses of Westeros, type: " + "[list]".red.bold
    puts "**SPOILER WARNING**".red
    puts "To check which houses made it to the end, type: " + "[status]".red.bold
    puts "To reveal the ultamate spoilers, type: " + "[spoil me silly]".red.bold
    puts ""
    puts "To exit type: " + "[exit]".red.bold
    puts ""
  end


def get_house_detail(input)
  input=input.to_i
    if (1..House.all.length).to_a.include?(input)
    selected_house = House.all[input -1]
      Scraper.general_information(selected_house)
      puts ""
      puts "                            "+ selected_house.name.bold
      puts ""
      puts "House sigial: "+ selected_house.sigil
      puts "House motto:  "+ selected_house.motto
      puts ""
      puts selected_house.summary
      puts ""
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
  elsif input == "status"
    status
  elsif input == "spoil me silly"
    spoil
  elsif input == "exit"
    exit
  else
    puts "The Lord Command Snow knows nothing...Try again".blue.bold
  end
 orders
end


def pathways
  puts ""
  puts "To return back to the main page type: " + "[welcome]".red.bold
  puts "To see the list of the great houses of Westeros, type: " + "[list]".red.bold
  puts "SPOILER WARNING ".red + "To check which houses made it to the end, type: " + "[status]".red.bold
  puts ""
  puts "To exit type: " + "[exit]".red.bold
  puts ""
   input= gets.strip
    if input == "welcome"
      run
    elsif input == "list"
      list_of_house
    elsif input == "status"
      status
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
 House.all.each_with_index {|house,index| puts "[#{index+1}]".bold + "#{house.name}"}
 puts ""
 puts "To see the general information about a house, type numbers:" "[1-20]".blue.bold
 puts "To see menu type:" "[menu]".blue.bold
 puts ""
  input= gets.strip
if input.to_i.to_s == input
  get_house_detail(input)
   puts ""
   puts "To see menu type:" "[menu]".blue.bold
   puts "to return back to the list of houses types:" "[list]".blue.bold
   puts ""
  input= gets.strip
    if input == "list"
      list_of_house
    elsif input == 'menu'
      pathways
    else
      pathways
    end
 else
  input == "menu"
  pathways
 end
end

def status
  puts ""
  puts"[These following house made to the end of season 8:]".bold
  puts ""
  House.all[0..7].each_with_index {|house,index| puts "[#{index+1}]".bold + " #{house.name}".green}
  puts ""
  puts "[Twelve Great Houses have gone extinct, three of which were as a result of their defeat in the Targaryen Conquest, four of which as a result of the War of the Five Kings:]".bold
  puts ""
  House.all[8..19].each_with_index {|house,index| puts "[#{index+9}]".bold + " #{house.name}".red}
  puts ""
  puts "To see the general information about a house, type numbers:" + "[1-20]".blue.bold
  puts "To see menu type:" + "[menu]" .blue.bold
  puts ""
     input= gets.strip
  if input.to_i.to_s == input
    get_house_detail(input)
    pathways

  else
    pathways
end

end

def spoil
  puts ""
  puts "ARE YOU SURE YOU WANT TO SPOIL THE SHOW?" + "[Y/N]".red.bold
  puts ""
  input= gets.strip
    if input == "Y"||"y"
    puts ""
     puts "wow. are you even a true fan...? Alright last warning, type " + "[spoiler]".red.bold
     puts "if you are heistating and want to go back type: " + "[regret]".red.bold + " to return to back to the welcome page"
    puts ""
        input= gets.strip
          if input == "spoiler"
            puts ""
            puts "                Arya sticked the Night King with the pointy end.".yellow.bold
            puts ""
            pathways
          elsif input == "regret"
            welcome
          end
    elsif input == "N"||"n"
      puts ""
      puts "I smell regret. no worries - type," "[regret]".red.bold + " to return to back to the welcome page"
      puts ""
      input= gets.strip

      if input == "welcome"
        puts welcome
      else
        puts ""
        puts "Dude, you are confused."
        puts ""
        pathways
      end
    end
end


end #final end
