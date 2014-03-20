class LongRange
  attr_reader :top_left_point_long, :bottom_right_point_long, :max

  def initialize(top_left_point_long, bottom_right_point_long)
    @top_left_point_long = top_left_point_long
    @bottom_right_point_long = bottom_right_point_long
    @max = 180
  end

  def include?(point)
    long_range.any? { |r| r.include?(point) }
  end

  def long_range
    if bottom_right_point_long > top_left_point_long
      [(top_left_point_long..bottom_right_point_long)]
    else
      [(top_left_point_long..max), (-max..bottom_right_point_long)]
    end
  end

end
