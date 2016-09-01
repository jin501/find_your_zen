class FindYourZen::Zen

  attr_accessor :name, :position, :description, :more, :place

  @@all = []

  def initialize(name = nil, place = nil)
    @name = name
    @place = place
    # self.all << self
  end


      # index = input_to_index(input)
      # limb_array[index] 

      #make this method print each value in hash

  def description(index)
    Scraper.new.limbs_description[index]
  end


  def more
    if @index == 1
      #list yamas
    elsif @index == 2
      #list niyamas
    else 
      reroute
    end
  end

end

