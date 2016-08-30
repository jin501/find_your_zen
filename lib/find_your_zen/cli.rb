#Our CLI Controller
class FindYourZen::CLI

  def call
    intro
    menu
  end
  
  def intro
    puts "------------------------------------"
    # FindYourZen::Scraper.new.intro
    puts "------------------------------------"
    puts ""
     
  end

  def list_classes
    puts <<-DOC
    1. Ashtanga - Studio - TIME/Day - Location
    2. Vinyasa - Studio - Time/day - Location
    3. Bikram - Studio - Time/day - Location
    DOC
  end

  def menu
    puts "[ > The eightfold path: 8 limbs of Yoga < ]"
    puts "1. Yama"
    puts "2. Niyama"
    puts "3. Asana"
    puts "4. Pranayama"
    puts "5. Pratyahara"
    puts "6. Dharana"
    puts "7. Dhyana"
    puts "8. Samadhi"
    puts "select a limb to learn more about 1-8:"
    puts ""
  end

end