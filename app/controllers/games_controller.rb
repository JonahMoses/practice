class GamesController < ApplicationController

  def new
  end

  def create
    @battleship_points = get_points
    @rectangle = get_rectangle
    validation
  end

private

  def validation
    if @battleship_points.all? { |p| p.valid? } && @rectangle.all? { |r| r.valid? }
      render :result
    else
      validate_points
      validate_rectangles
      render :new
    end
  end

  def validate_points
    valid_battleship_points = @battleship_points.each_with_index.map {|bp, i| [i, bp.valid?]}
    @invalid_points = valid_battleship_points.reject {|i,v| v}
    unless @invalid_points.empty?
      append_to_notice("Invalid Battleship Points at lines: #{@invalid_points.map(&:first).join(',')}")
    end
  end

  def validate_rectangles
    rectangle_points = @rectangle.map {|r| r.points}.flatten
    valid_rectangle_points = rectangle_points.each_with_index.map {|r, i| [i, r.valid?] }
    @invalid_rectangles = valid_rectangle_points.reject {|i,v| v}
    unless @invalid_rectangles.empty?
      append_to_notice("Invalid Rectangle Points at lines: #{@invalid_rectangles.map(&:first).join(',')}")
    end
  end

  def append_to_notice(message)
    if flash[:notice]
      flash[:notice] << message
    else
      flash[:notice] = [message]
    end
  end

  def point_params
    params[:battleship_points].first.split("\r\n")
  end

  def rectangle_params
    params[:rectangle_points].first.split("\r\n")
  end

  def get_points
    point_params.map { |bp| Point.from_input(bp) }
  end

  def get_rectangle
    rectangle_params.map { |r| Rectangle.from_input(r) }
  end

end
