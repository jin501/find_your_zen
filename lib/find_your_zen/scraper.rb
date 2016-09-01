require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.yogajournal.com/article/beginners/the-eight-limbs/"))
  end

  def quotes
    quotes = Nokogiri::HTML(open("http://www.lexiyoga.com/yoga-quotes"))
    i = 0 + rand(20)
    quote = quotes.css("p q")[i].text
 
    puts quote.colorize(:light_blue)
  end

  def intro
     intro = self.get_page.css("div p")[1].text
        puts intro
  end

  def make_limbs
    i = 0
    8.times do 
      limbs_hash = {
        name: self.get_page.css("h2")[i].text,
        description: self.get_limbs_description[i]
      }
      if i == 0
          limbs_hash[:more] = self.get_page.css("p")[3..7].text.gsub(/(?=[A-Z])/, '!').split("!")
        elsif i == 1
          limbs_hash[:more] = self.get_page.css("p")[8..13].text.gsub(/(?=[A-Z])/, '!').split("!")
        else
          limbs_hash[:more] = nil
      end

      FindYourZen::Zen.new(limbs_hash)
      i += 1
    end
  end


  def get_limbs_description
    limbs_hash = {}
    limbs_hash[:description] = [self.get_page.css("p")[2].text, #yamas desc
      self.get_page.css("p")[8].text, #niyamas desc
      self.get_page.css("p")[15].text, #asanas desc
      self.get_page.css("p")[17].text, #pranayama
      self.get_page.css("p")[20].text, #pratyhara desc
      self.get_page.css("p")[21].text, #dharana 
      self.get_page.css("p")[23].text, #dhyana
      self.get_page.css("p")[24].text #samadhi
      ]
    end
end



# Scraper.new.get_page("http://www.yogajournal.com/article/beginners/the-eight-limbs/")
