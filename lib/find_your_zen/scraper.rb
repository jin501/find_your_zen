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
 
    puts quote
  end

  def intro
     intro = self.get_page.css("div p")[1].text
        puts intro 
  end

  def make_limbs(place)
    i = place 
    # place = 1
    limbs_hash = {}
    # until i == 8
    x = FindYourZen::Zen.new(limbs_hash[:limbs] = self.get_page.css("h2")[i].text, place)
    # i += 1
    # place += 1
    # binding.pry
    # end
  end

# Scraper.new.limbs_list

  def limbs_description
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
# Scraper.new.limbs_description
  #   limbs_hash[:yamas] = self.get_page.css("p")[3].text - self.get_page.css("p")[7].text


  #   limbs_hash[:niyamas] = self.get_page.css("p")[8].text - self.get_page.css("p")[13].text


#     index_url =  = "http://yoganonymous.com/yoga-philospophy-you-can-use-yamas-101"
#     limbs = Nokogiri::HTML(open(index_url))
#     eight_limbs = []
#     limbs_hash = {}

#     limbs.each do |limb|
#       i = 1
#       limbs_hash[:ni_yamas] = limbs.css("p strong")[i].text


#       # limbs_hash[:description] = limbs.css("p")[3].text
      


# Scraper.new.get_page("http://www.yogajournal.com/article/beginners/the-eight-limbs/")
