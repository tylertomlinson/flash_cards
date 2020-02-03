class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count {|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.count { |turn| turn.card.category == category}
    (number_correct_by_category(category).to_f / total_in_category) * 100
  end

  def current_card_index
    @deck.cards.find_index(current_card) + 1
  end

  def size_of_deck
    @deck.count
  end

  def answer_feedback
    @turns.last.feedback
  end

  def start
    puts "Welcome! You are playing with #{size_of_deck} cards." + "\n\n"
    puts "-=-=-=-=-=-=-GOOD LUCK-=-=-=-=-=-=-" + "\n\n"

    until current_card == nil
    puts "--------------------------------------" + "\n"
    puts "This is card number #{current_card_index} out of #{size_of_deck}" + "\n"
    puts "\n" + current_card.question

    user_guess = gets.chomp
    take_turn(user_guess)
    puts "Your answer is: #{answer_feedback}"
    end

    puts "\n\n" "-=-=-=-=-=-=- Game over! -=-=-=-=-=-=-" + "\n\n"
    puts "Press ENTER to see results"
    user_input = gets.chomp

    puts "You had #{number_correct} correct answers out of #{size_of_deck} for a total score of #{percent_correct.to_i}%"

    puts "American History - #{percent_correct_by_category("American History")}% correct"
    puts "World History - #{percent_correct_by_category("World History")}% correct"
    puts "Sports - #{percent_correct_by_category("Sports")}% correct"
    puts "Entertainment - #{percent_correct_by_category("Entertainment")}% correct"
  end
end
