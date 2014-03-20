require 'csv'

class Point
  attr_reader :lat, :long

  def initialize(lat, long)
    @lat = lat.to_f
    @long = long.to_f
  end

  def valid?
    @lat.between?(-90,90) && @long.between?(-180,180)
  end

  def self.from_input(input)
    new(*CSV.parse(input).flatten)
  end

end
