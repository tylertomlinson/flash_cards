require "./lib/card"

class CardGenerator

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def card_info
    (File.read(@filename).split("\n")).collect {|card| card.split(",")}
  end
end
