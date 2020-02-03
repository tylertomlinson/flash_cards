require_relative 'test_helper'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def setup
    @cardgenerator = CardGenerator.new('cards.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cardgenerator
  end

  def test_it_creates_cards
    assert_equal 10, @cardgenerator.cards.count
  end

  def test_cards_have_questions_answers_and_category
    skip
    assert_equal "The citadel Machu Picchu is located in which Latin American Country?", @card_generator.card.question
    assert_equal "Peru", @CardGenerator.card.answer
    assert_equal "World Hisotry", @card_generator.card.category
  end
end
