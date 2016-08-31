class FindYourZen::Zen

  attr_accessor :name, :position, :description, :more_info

  @@all = []

  def initialize(name = nil, description = nil)
    @name = name
    @description = description
  end


      # index = input_to_index(input)
      # limb_array[index] 

      #make this method print each value in hash

  def description
    Scraper.new.limbs_description[input]
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

end