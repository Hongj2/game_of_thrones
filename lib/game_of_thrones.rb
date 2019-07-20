#enviornment 
#list all the gem that is being used
require 'nokogiri'
require 'colorize'
require 'open-uri'
require_relative "./game_of_thrones/version"

module GameOfThrones
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './my_cli_got'
require_relative './scraper'
require_relative './houses'