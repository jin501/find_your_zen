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

  def find_by_name

  end

  def find(input)
    self.all[input-1]
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

