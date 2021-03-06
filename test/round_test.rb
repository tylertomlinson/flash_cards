require_relative 'test_helper'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_the_round_has_a_deck_with_cards
    assert_equal @deck, @round.deck
    assert_equal 3, @round.size_of_deck
    assert_instance_of Card, @round.deck.cards.first
  end

  def test_round_starts_with_zero_turns
    assert_equal [], @round.turns
  end

  def test_current_card_is_correct_and_in_the_right_position
    assert_equal @card_1, @round.current_card
    assert_equal 1, @round.current_card_index

    @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
    assert_equal 2, @round.current_card_index
  end

  def test_turn_is_created
    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_round_can_take_multiple_turns_and_feedback_is_correct
    @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
    assert_equal "Correct!", @round.answer_feedback

    @round.take_turn("Venus")
    assert_equal @card_3, @round.current_card
    assert_equal "Incorrect!", @round.answer_feedback
  end

  def test_round_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_correct_answers_by_rounds
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct

    @round.take_turn("Mars")
    assert_equal 2, @round.number_correct

    @round.take_turn("Earth")
    assert_equal 2, @round.number_correct
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end
end
