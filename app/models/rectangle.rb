require 'csv'

class Rectangle
  attr_reader :top_left_point, :bottom_right_point, :lat_range, :long_range

  def initialize(point1, point2)
    @top_left_point = point1
    @bottom_right_point = point2
    @lat_range = LatRange.new(top_left_point.lat, bottom_right_point.lat)
    @long_range = LongRange.new(top_left_point.long, bottom_right_point.long)
  end

  def valid?
    [different_lats, different_longs, valid_points?].all?
  end

  def includes?(point)
    lat_range.include?(point.lat) && long_range.include?(point.long)
  end

  def points
    [top_left_point, bottom_right_point]
  end

  def self.from_input(input_pairs)
    p1_lat, p1_long, p2_lat, p2_long = CSV.parse(input_pairs).flatten
    new(Point.new(p1_lat, p1_long), Point.new(p2_lat, p2_long))
  end

private

  def different_lats
    top_left_point.lat != bottom_right_point.lat
  end

  def different_longs
    top_left_point.long != bottom_right_point.long
  end

  def valid_points?
    points.all?(&:valid?)
  end

end
