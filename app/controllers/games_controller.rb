require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    # TODO: generate random grid of letters
    @letter_grid = (0...10).map { (65 + rand(26)).chr }

  end

  def score
    # gets the guess from user input using params
    user_guess = params[:guess]
    current_letter_grid = params[:letter_grid]

    # capitalizes the guess to standardize it with the grid for comparison purposes
    # which is in all caps (for nice aesthetic reasons)
    user_guess_caps = user_guess.upcase
    # compare grid and attempts_caps - are all letters in attempts_caps contained in the grid?
    # found answer https://stackoverflow.com/questions/46550015/how-do-i-find-and-match-unique-letters-in-a-string-in-ruby
    if user_guess_caps.chars.all?{ |char| current_letter_grid.include?(char) }
      # looks to find the word using the API
      url = "https://wagon-dictionary.herokuapp.com/#{user_guess_caps}"
      real_word = URI.open(url).read
      is_real_word = JSON.parse(real_word)
      # returns a true or false value from the API, depending on whether the word is found.
      @true_false = is_real_word["found"]
      if @true_false
        @response_to_user = "Nice! #{user_guess_caps} is a real word and it was part of the letters #{current_letter_grid} !"
      else
        @response_to_user = "Sorry ☹️ #{user_guess_caps} is found in the letters #{current_letter_grid}, but it's not a real word in the dictionary."
      end
    else
      @response_to_user = "Very creative, but your word #{user_guess_caps} is not found in the letters #{current_letter_grid}"
    end
  end
end
