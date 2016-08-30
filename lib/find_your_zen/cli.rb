#Our CLI Controller
class FreeFitness::CLI

  def call
    puts "[ > Free Fitness Classes in NYC < ]"
    menu 
  end

  def list_classes
    puts <<-DOC
    1. Ashtanga - Studio - TIME/Day - Location
    2. Vinyasa - Studio - Time/day - Location
    3. Bikram - Studio - Time/day - Location
    DOC
  end

  def menu
    puts "Search for your next free class by:"
    puts "1. time [morning, afternoon, evening]"
    puts "2. style [ashtanga, vinyasa, bikram]"
    puts "3. level [beginner, intermediate, advanced]"
    puts "4. specials"
    puts "--please select by entering 1-3:"
  end

end