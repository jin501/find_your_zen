# require 'open-uri'
# require 'nokogiri'
# require 'pry'
# require 'iconv'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.yogajournal.com/article/beginners/the-eight-limbs/"))
  end

  def quotes
    quotes = Nokogiri::HTML(open("http://www.lexiyoga.com/yoga-quotes"))
    quote = quotes.css("p q").text
    binding.pry
    # i = 1 + rand(11)
    # i = 0
    # quotes_array = []
    # q = quotes.css("p q")[i].text.each do
    #   quotes_array << q
    #   i += 1
  end

  def intro
    self.get_page.css("div p")[1].text
  end

  def limbs_list
    i = 0
    limbs_hash = {}
    limbs_hash[:limbs] = self.get_page.css("h2")[i].text
    i += 1
    # binding.pry
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
      binding.pry
    end

  end
Scraper.new.limbs
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
