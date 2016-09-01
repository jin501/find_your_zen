class FindYourZen::Zen

  attr_accessor :name, :description, :more

  @@all = []

  def initialize(name:, description:, more: nil)
    @name = name
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(input)
    self.all[input-1]
  end

  def self.find_by_name(name)
    self.all.detect do |m|
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end


  # def description(index)
  #   Scraper.new.limbs_description[index]
  # end

  # def description(place)


  # def more
  #   if @place == 1
  #     #list yamas
  #   elsif @place == 2
  #     #list niyamas
  #   else 
  #     reroute
  #   end
  # end

end

