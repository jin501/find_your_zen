#Our CLI Controller
require_relative 'scraper'
class FindYourZen::CLI

  def call
    FindYourZen::Zen.new.input_to_index(2)
    title
    intro
    menu
    start
  end

  def title
    puts "----------------------------------------"
    puts "[ > The eightfold path: 8 limbs of Yoga < ]"
    puts "----------------------------------------"
    puts ""
  end

  def intro
    Scraper.new.intro
  end

  def menu
    puts "The 8 limbs of yoga are:"
    puts ""
    puts "1. Yama"
    puts "2. Niyama"
    puts "3. Asana"
    puts "4. Pranayama"
    puts "5. Pratyahara"
    puts "6. Dharana"
    puts "7. Dhyana"
    puts "8. Samadhi"
    puts ""
  end

  def start
    puts "select a limb to learn more [enter a number 1-8]:"
    puts ""
    puts "<enter exit to end the program.>"
    puts ""
    input = gets.strip

    if input == "exit"
      puts ""
      puts "Namaste, Jai Bhwagan"
    elsif input.to_i > 8
      title
      menu
      start
    elsif input.to_i > 0
      index = input.to_i - 1
      print_details(index)

    else input.to_i == 0
      title
      menu
      start
    end
  end

  def print_details(index)
    print_info(index)
    # puts "----------- #{zen.index} - #{zen.name} -----------"
    # puts ""
    # puts "quote"
    # puts ""
    # puts "---------------Description--------------"
    # puts ""
    # puts "#{zen.description}"
    # puts ""
    puts "---------------Learn More--------------"
    puts ""
    menu_options
    puts ""
  end

  def print_info(index)
    puts Scraper.new.limbs_description[index]
  end


  def menu_options
    puts ""
    puts "enter an option:"
    puts "[back] [more] [go to site] [exit]"
    puts ""

    input = gets.strip.downcase
    if input == "back"
      title
      menu
      start
    elsif input == "more"
      #method to go to more page, call it here
    elsif input == "go to site"
      #method that launches site
    elsif input == "exit"
      puts ""
      puts "Namaste!"
    else
      puts "please enter one of the following:"       
    end
  end
  

end