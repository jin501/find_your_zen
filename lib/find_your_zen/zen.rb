class FindYourZen::Zen

  attr_accessor :name, :position, :description, :more, :place

  @@all = []

  def initialize(name = nil, place = nil)
    @name = name
    @place = place
    # self.all << self
  end

      #make this method print each value in hash

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

