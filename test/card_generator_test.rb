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
    assert_equal 3, @cardgenerator.cards.count
  end
end
