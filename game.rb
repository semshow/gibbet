class Game
  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(word)
    word.downcase.split('') # split returns letters from guessed word with spaces ('') between
  end

  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva) ||
      (bukva == "е" && @letters.include?("ё")) ||
      (bukva == "ё" && @letters.include?("е")) ||
      (bukva == "и" && @letters.include?("й")) ||
      (bukva == "й" && @letters.include?("и"))

      @good_letters << bukva
      @good_letters << "ё" if bukva == "е"
      @good_letters << "е" if bukva == "ё"
      @good_letters << "й" if bukva == "и"
      @good_letters << "и" if bukva == "й"

      if (@letters - @good_letters).empty?
        return 1
      end
    else
      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  def ask_next_letter
    puts "\nPlease enter next letter"
    letter = ''
    while letter == ''
      letter = STDIN.gets.downcase.chomp
    end

    next_step(letter)
  end

  attr_reader :letters, :good_letters, :bad_letters, :status, :errors
end

