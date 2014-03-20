require 'spec_helper'

describe Rectangle do
  let(:good_point1) { Point.new(40, 60) }
  let(:good_point2) { Point.new(-40, 165) }
  let(:bad_point) { Point.new(-350,-350) }
  let(:rectangle) {
    input_pairs = "45,45,-50,-175"
    Rectangle.from_input(input_pairs)
  }

  context "validity" do
    it "is invalid if any point of rectangle input is invalid" do
      Rectangle.new(good_point1, bad_point).should_not be_valid
    end

    it "is invalid if both points equal each other" do
      Rectangle.new(good_point1, good_point1).should_not be_valid
    end

    it "is valid if both points are good and not equal each other" do
      Rectangle.new(good_point1, good_point2).should be_valid
    end
  end

  context "rectangle inside/outside" do
    it "builds rectangle from csv line" do
      rectangle.top_left_point.lat.should == 45
      rectangle.top_left_point.long.should == 45
      rectangle.bottom_right_point.lat.should == -50
      rectangle.bottom_right_point.long.should == -175
    end

    it "knows what point is inside or not" do
      rectangle.includes?(good_point1).should be_true
      rectangle.includes?(good_point2).should be_true
    end

    it "knows when a point is outside" do
      rectangle.includes?(Point.new(35,-35)).should be_false
      rectangle.includes?(Point.new(-60,135)).should be_false
      rectangle.includes?(Point.new(-60,135)).should be_false
      rectangle.includes?(Point.new(65,130)).should be_false
      rectangle.includes?(Point.new(28,-150)).should be_false
      rectangle.includes?(Point.new(-30,-150)).should be_false
    end
  end

  context "international dateline / prime meridian" do
    let(:international_battleship1) { Point.new(1,179) }
    let(:international_rectangle1) {
      input_pairs = "5,175,-5,-175"
      Rectangle.from_input(input_pairs)
    }
    let(:international_battleship2) { Point.new(1,-179) }
    let(:international_rectangle2) {
      input_pairs = "30,140,-30,-140"
      Rectangle.from_input(input_pairs)
    }

    let(:prime_battleship1) { Point.new(25,-1) }
    let(:prime_battleship2) { Point.new(25,1) }
    let(:prime_rectangle) {
      input_pairs = "50,-25,0,25"
      Rectangle.from_input(input_pairs)
    }

    it "handles the international dateline correctly" do
      international_rectangle1.includes?(international_battleship1).should be_true
    end

    it "passes through the 180 degrees dateline" do
      international_rectangle2.includes?(international_battleship1).should be_true
      international_rectangle2.includes?(international_battleship2).should be_true
    end

    it "passes through the 0 degree dateline" do
      prime_rectangle.includes?(prime_battleship1).should be_true
      prime_rectangle.includes?(prime_battleship2).should be_true
    end
  end

end
