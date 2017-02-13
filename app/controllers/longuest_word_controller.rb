class LonguestWordController < ApplicationController
  def game
    @grid = generate_grid(10)
    @start_time = Time.now
    session[:grid] = @grid
    session[:start_time] = @start_time
  end

  def score
    @attempt = params[:your_try]
    grid = session[:grid]
    start_time = Time.parse(session[:start_time])
    end_time = Time.now
    @result = run_game(@attempt, grid, start_time, end_time)
  end

  private

  def generate_grid
    grid = []
    alphabet = ("A".."Z").to_a
    grid_size.times do
      grid << alphabet[rand(26)]
    end
    grid
  end

  def frequency
    letters_frequency = Hash.new(0)
    a_string.chars.each { |letter| letters_frequency[letter] += 1 }
    letters_frequency
  end

  def attempt_valid?(attempt, grid)
    grid_frequency = frequency(grid.join(''))
    frequency(attempt.upcase).each do |letter, frequency|
      return false if frequency > grid_frequency[letter]
    end
    true
  end

  def translate_word(attempt)
    url = URI_SYS + attempt
    translation_response = open(url).read
    translation = JSON.parse(translation_response)
    translation["outputs"][0]["output"]
  end

  def english_word(attempt)
    words = File.read('/usr/share/dict/words').upcase.split("\n")
    words.include?(attempt.upcase) ? (return true) : (return false)
  end

  def well_done
  end

  def not_english_word
  end

  def not_in_grid
  end

  def run_game
  end
end
