require 'spec_helper'

describe "play battleship game" do
  it "places a battleship and gives you a result of your rectangle guess" do
    visit root_path

    within("#battleships") do
      fill_in "Battleships:", with: <<-input
        45.511159,-122.695312
        47.587642,-122.310791
        37.640335,-122.387695
        37.600000,-122.300000
        input
    end

    within("#rectangle") do
      fill_in "Rectangles:", with: <<-input
        37.504824,-122.676086,37.740335,-122.287695
        18.104087,-81.298828,18.908885,-82.369995
        -15.045601,-61.21582,-12.57601,-73.828125
        input
    end

    click_on("Submit")

    expect(page).to have_text("Result: 37.504824, -122.676086, 37.740335, -122.287695: HIT: [(37.640335, -122.387695) (37.6, -122.3) ]
                              Result: 18.104087, -81.298828, 18.908885, -82.369995: MISS
                              Result: -15.045601, -61.21582, -12.57601, -73.828125: MISS
")
  end

end
