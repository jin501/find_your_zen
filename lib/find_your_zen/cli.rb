#Our CLI Controller
require_relative 'scraper'
require_relative 'quote_scraper' #this is required for this file to know about quote_scraper
class FindYourZen::CLI

  attr_reader :scraper, :quotescraper
  
  def initialize
    @scraper = Scraper.new
    @quotescraper = QuoteScraper.new
  end

  def call
    welcome
    scraper.make_limbs
    title
    intro
    menu
    start
  end

  def welcome
    puts " Welcome 🙏"
    puts ""
    puts "....scraping content....✨"
    puts ""
    puts "            ....creating instances....✨"
    puts ""
    puts "                                    ...patience...✨"
    puts ""
    puts "\"one who masters patience masters everything else..\"".colorize(:light_blue)
    puts ""
  end

  def title
    puts "-------------------------------------------"
    puts "[ॐ  The eightfold path: 8 limbs of Yoga ॐ ]"
    puts "-------------------------------------------"
    puts ""
  end

  def intro
    scraper.intro
  end


  def menu
    limbs = FindYourZen::Zen.all
    puts ""
    puts "The 8 limbs of yoga are:"
    puts ""

    limbs.each do |limb|
      puts limb.name
      puts ""
    end
  end

  def start
    puts ""
    puts "[select a limb 1-8 to learn more]".colorize(:blue)
    # puts ""
    puts "[enter 'exit' to end the program]".colorize(:red)
    puts ""
    input = gets.strip
    puts ""

    if input == "exit"
      puts ""
      a = " 🙏  Namaste" 
      b = "♥".colorize(:red) 
      c = "Jai Bhwagan 🙏 "
      puts a+b+c

    elsif input.to_i > 8
      title
      menu
      start

    elsif input.to_i > 0
      i = input.to_i - 1

      print_details(i)
      
    else input.to_i == 0
      title
      menu
      start
    end
  end

  def print_details(i)
    limb = FindYourZen::Zen.all
    
    puts ""
    puts "--------------ॐ  #{limb[i].name} ॐ -----------------"
    puts ""
    puts quotescraper.quotes
    puts ""
    puts "---------------About this limb--------------"
    puts ""
    puts limb[i].description
    puts ""
    puts "---------------Learn More--------------"
    puts ""
    menu_options(i)
    puts ""
  end

  def menu_options(i)
    limb = FindYourZen::Zen.all
    puts ""
    puts "[back] [next] [details] [site] [exit]".colorize(:blue)
    puts ""
    input = gets.strip.downcase

    if input == "back"
      title
      menu
      start

    elsif input == "next"
      puts ""
      if i == 7
        puts "[this is the last limb. returning to main menu..]".colorize(:gray)
        puts ""
        puts ""
        title
        menu
        start
      else i = i + 1
        print_details(i)
      end

    elsif input == "details" 
      puts ""
      if i == 0 || i == 1
        puts "---To master this limb, one must be mindful of these practices:"
        puts limb[i].more
        menu_options(i)
      else 
        puts "[to learn more about this limb enter 'site' to launch to website]"
        menu_options(i)
      end

    elsif input == "site"
      Launchy.open( "http://www.yogajournal.com/article/beginners/the-eight-limbs/" )
      menu_options(i)
      puts ""
    elsif input == "exit"
      puts ""
      a = " 🙏  Namaste" 
      b = "♥".colorize(:red) 
      c = "Jai Bhwagan 🙏 "
      puts a+b+c
      puts ""
    else
      puts "please enter one of the following:"
      menu_options(i)
    end
  end
 

end