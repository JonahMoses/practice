require 'spec_helper'

describe Point do

  it "accepts valid latitude point" do
    Point.new(0, 1).should be_valid
    Point.new(89, 1).should be_valid
    Point.new(-89, 1).should be_valid
    Point.new(90, 1).should be_valid
  end

  it "accepts valid longitude points" do
    Point.new(1, 179).should be_valid
    Point.new(1, -179).should be_valid
    Point.new(1, 180).should be_valid
    Point.new(1, 0).should be_valid
  end

  it "doesn't accept an invalid latitude points" do
    Point.new(91, 123).should_not be_valid
    Point.new(-91, 123).should_not be_valid
  end

  it "doesn't accept an invalid longitude points" do
    Point.new(75, 181).should_not be_valid
    Point.new(75, -181).should_not be_valid
  end

  it "parses the inputs" do
    battleship_location = "46.00000,123.12345"
    point = Point.from_input(battleship_location)
    point.lat.should == 46.0
    point.long.should == 123.12345
  end

end
