class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.strip.downcase == @card.answer.downcase
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
