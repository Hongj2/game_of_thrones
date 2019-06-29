class GOT
  def welcome
    puts ""
    puts"       |>      |>                     |>      |>"
    puts"       |_-___-_|                      |_-___-_|"
    puts"        |vvvvv|                        |vvvvv|"
    puts"       |__[[]]_|                      |_[[]]__|"
    puts"      |   |**|  |_-_-_-_-_-_-_-_-_-_-_| |**|  |"
    puts"     |    |  |   vvvvvvvvvvvvvvvvvvvvv  |  |   |"
    puts"     |    |XX|          GAME OF         |XX|   |"
    puts"     |    |()|          THRONES         |()|   |"
    puts"     |     \/      vvvvvvvvvvvvvvvvv     \/    |"
    puts"     |                  +++++                  |"
    puts"     |                _/     \_                |"
    puts"     |               _|   O   |_               |"
    puts"     |               _|  ooo  |_               |"
    puts"     |mmmmmmmmmmmmmmmm|       |mmmmmmmmmmmmmmmm|"
    puts ""
    puts "To see the list of the great houses of Westeros, type: list.".bold 
    puts "To see the information of all the houses of Westeros, type: all".bold
  end 
  
 def list_of_house
    input=gets.strip
    if input== "list"
      list = Scraper.house.text.split("House")
      list.each_with_index{|house,index| puts "[#{index+1}] #{house}"}
    end
    list
end

  def general_info
    input=gets.strip
    if input == "all"
      all = Scraper.house.text.split("\n")
      all.each_with_index{|house,index| puts "[#{index+1}] #{house}"}
    elsif input == "exit"
    system "clear" or sys "cls"
    exit
  else
    puts "give me something to work..Try again".bold
    
  def menu
end
 



end

