class LatRange
  attr_reader :top_left_point_lat, :bottom_right_point_lat

  def initialize(top_left_point_lat, bottom_right_point_lat)
    @top_left_point_lat = top_left_point_lat
    @bottom_right_point_lat = bottom_right_point_lat
  end

  def include?(point)
    lat_range.any? { |r| r.include?(point) }
  end

  def lat_range
    if top_left_point_lat > bottom_right_point_lat
      [(bottom_right_point_lat..top_left_point_lat)]
    else
      [(top_left_point_lat..bottom_right_point_lat)]
    end
  end

end
