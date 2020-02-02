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

  def categories
    @turns.map {|turn| turn.card.category }.uniq
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    total_in_category = turns.count { |turn| turn.card.category == category}
    100 * number_correct_by_category(category).to_f / total_in_category
  end

  def start

    puts "Welcome! You are playing with #{@deck.count} cards." + "\n\n"
    puts "-------------GOOD LUCK----------------" + "\n\n"

    until self.current_card == nil
    puts "This is card number #{self.current_card} out of #{@deck.count}"
    puts self.current_card.question
    #need to have format of user response have correct formatting when comparing to answer.
    user_guess = gets.chomp.to_s
    self.take_turn(user_guess)
    puts "Your answer is: #{@turns.last.feedback}"
    end

    puts "------------- Game over! -------------" + "\n\n"

    puts "You had #{self.number_correct} correct answers out of #{@deck.count} for a total score of #{self.percent_correct.to_i}%"

    puts "History - #{self.percent_correct_by_category(:History)}% correct"
    puts "Sports - #{self.percent_correct_by_category(:Sports)}% correct"
    puts "Entertainment - #{self.percent_correct_by_category(:Entertainment
    )}% correct"
  end

end
