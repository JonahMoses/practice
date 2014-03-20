require 'spec_helper'

describe GamesController do

  it "creates a new game" do
    get :new
    response.should be_success
  end

  it "plays the game" do
    post :create, :'battleship_points' => ['85,123'], :'rectangle_points' => ['85,123,85,123']
    response.should be_success
  end
end
