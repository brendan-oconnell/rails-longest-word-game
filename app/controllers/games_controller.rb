class GamesController < ApplicationController
  def new
    # TODO: generate random grid of letters
    @letter_grid = (0...10).map { (65 + rand(26)).chr }

  end

  def score
    raise
  end
end
