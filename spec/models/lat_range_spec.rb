require 'spec_helper'

describe LatRange do

  it "creates the correct positive ranges" do
    range = LatRange.new(12,50)
    range.include?(13).should be_true
    range.include?(49).should be_true
    range.include?(11).should be_false
    range.include?(51).should be_false
  end

  it "creates the correct negative ranges" do
    range = LatRange.new(-50,-12)
    range.include?(-13).should be_true
    range.include?(-49).should be_true
    range.include?(-11).should be_false
    range.include?(-51).should be_false
  end

end
