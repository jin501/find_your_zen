require 'open-uri'
require 'nokogiri'
require 'pry'

class QuoteScraper

  def quotes
    quotes = Nokogiri::HTML(open("http://www.lexiyoga.com/yoga-quotes"))
    i = 0 + rand(20)
    quote = quotes.css("p q")[i].text
 
    puts quote.colorize(:light_blue)
  end

end