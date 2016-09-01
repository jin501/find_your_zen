#Our CLI Controller
require_relative 'scraper'
class FindYourZen::CLI

  def call
    puts "Welcome"
    puts ""
    puts "....scraping content...."
    puts ""
    puts ""
    puts "            ....creating instances...."
    puts ""
    puts "                                 ...patience..."
    puts ""

    Scraper.new.make_limbs

    title
    intro
    menu
    start
  end

  def title
    puts "-------------------------------------------"
    puts "[ॐ  The eightfold path: 8 limbs of Yoga ॐ ]"
    puts "-------------------------------------------"
    puts ""
  end

  def intro
    Scraper.new.intro
  end

  def menu
    limb = FindYourZen::Zen.all
    puts ""
    puts "The 8 limbs of yoga are:"
    puts ""
    i = 0
    8.times do
      puts limb[i].name.gsub('\n', '')
      i+=1
    puts ""
    end
  end

  def start
    puts "select a limb to learn more [enter a number 1-8]:"
    puts ""
    puts "<enter exit to end the program>"
    puts ""
    input = gets.strip
    puts ""

    if input == "exit"
      puts ""
      puts "Namaste, Jai Bhwagan"

    elsif input.to_i > 8
      title
      menu
      start

    elsif input.to_i > 0
      i = input.to_i - 1

      print_details(i)


      puts limb[index].description

      
    else input.to_i == 0
      title
      menu
      start
    end
  end

  def print_details(i)
    limb = FindYourZen::Zen.all

    # limb = Scraper.new.make_limbs(index) 
    puts ""
    puts "--------------#{limb[i].name}-----------------"
    puts ""
    puts "\""
    puts Scraper.new.quotes
    puts "\""
    puts "---------------About this limb--------------"
    puts ""
    puts limb[i].description
    # puts print_info(index)
    puts ""
    puts "---------------Learn More--------------"
    puts ""
    menu_options(i)
    puts ""
  end

  def print_info(index)
    # limb.descipriton(index)
    puts Scraper.new.limbs_description[index]
  end

  def menu_options(i)
    puts ""
    puts "[back] [next] [more] [go to site] [exit]"
    puts ""

    input = gets.strip.downcase
    if input == "back"
      title
      menu
      start
    elsif input == "next"
      puts ""
      if i == 7
        puts "[this is the last limb, please enter 'back' to return to main menu]"

      else i = i + 1
        print_details(i)
      end

    elsif input == "more"
      limb.more
      #method to go to more page, call it here
    elsif input == "go to site"
      #method that launches site
    elsif input == "exit"
      puts ""
      puts "Namaste!"
    else
      puts "please enter one of the following:"
      menu_options(i)
    end
  end
  

end