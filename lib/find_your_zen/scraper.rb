require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  attr_reader :page
  
  def initialize
    @page = get_page
  end


  def get_page
    Nokogiri::HTML(open("http://www.yogajournal.com/article/beginners/the-eight-limbs/"))
  end

  def intro
     intro = page.css("div p")[1].text
        puts intro
  end

  def make_limbs
    i = 0
    self.page.css("h2").each_with_index do |limb_name, i|
      limbs_hash = {
        name: limb_name.text,
        description: get_limbs_description[i],
        more: get_details(i)
      }
    FindYourZen::Zen.new(limbs_hash)

  end

    
  end

  def get_limbs_description
    [ page.css("p")[2].text, #yamas desc
      page.css("p")[8].text, #niyamas desc
      page.css("p")[15].text, #asanas desc
      page.css("p")[17].text, #pranayama
      page.css("p")[20].text, #pratyhara desc
      page.css("p")[21].text, #dharana 
      page.css("p")[23].text, #dhyana
      page.css("p")[24].text #samadhi
      ]
  end

  def get_details(i)
    if i == 0
      self.page.css("p")[3..7].text.gsub(/(?=[A-Z])/, '!').split("!")
    elsif i == 1
      self.page.css("p")[8..13].text.gsub(/(?=[A-Z])/, '!').split("!")
    else
      nil
    end
  end

end
