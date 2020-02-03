require "./lib/card"

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def card_info
    (File.read(@filename).split("\n")).collect {|card| card.split(",")}
  end
  
  def cards
    card_info.map do |card|
      Card.new(card[0], card[1], card[2])
    end
  end
end
