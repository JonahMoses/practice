require 'spec_helper'

describe LongRange do

  it "wraps from 175 to 180/-180 to -175" do
    range = LongRange.new(175,-175)
    range.include?(179).should be_true
    range.include?(-179).should be_true
    range.include?(174).should be_false
    range.include?(-174).should be_false
  end

  it "wraps from -5 to 0 to 5" do
    range = LongRange.new(-5,5)
    range.include?(-4).should be_true
    range.include?(4).should be_true
    range.include?(-6).should be_false
    range.include?(6).should be_false
  end

end
