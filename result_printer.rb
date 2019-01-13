class ResultPrinter

  def initialize
    @status_images = []

    current_path = File.dirname(__FILE__ )
    counter = 0
    while counter <=7 do
    file_name = current_path + "/image/#{counter}.txt"

    if File.exist?(file_name)
      f = File.new(file_name)
      @status_images << f.read
      f.close
    else
      @status_images << "File not found"
    end
      counter += 1
    end
  end

  def get_word_for_print(letters, good_letters) # method shows our word with missing letters
    result = '' # variable with final result

    letters.each do |letter| # Check if good letters include each letter of our array letters
      if good_letters.include?(letter) # if includes - add to result
        result += "#{letter} "
      else
        result += "__ " # if not include add double downcase line
      end
    end
    result # return viriable result of method
  end

  def print_status(game) # method shows our lettes with missing letters, 2)bad letters, 3)info if we lost/win
    puts "\n Word:  #{get_word_for_print(game.letters, game.good_letters)}" #Our word with missing letters
    puts "Total errors: #{game.errors};"
    puts "#{game.bad_letters.join(', ')}" # Puts amount of errors and join of our bad letters

    print_gibbet(game.errors)


    if game.errors >= 7 # If errors >= 7 puts you lose
      puts "You lose!!!"
    else
      if game.letters.uniq.size == game.good_letters.size # Check if user guessed all letters
        puts "You win!!! \n\n"
      else
        "You have attempts: #{7 - game.errors}.to_s" # If no, Puts how many attempts he has
      end
    end
  end

  def print_gibbet(errors)
    puts @status_images[errors]
  end
end
