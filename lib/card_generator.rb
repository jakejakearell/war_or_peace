require './card'
class CardGenerator
  attr_reader :cards

  def initialize()
    @cards = []
    @name_rank = {
                     '2': 2,
                     '3': 3,
                     '4': 4,
                     '5': 5,
                     '6': 6,
                     '7': 7,
                     '8': 8,
                     '9': 9,
                     '10': 10,
                     'Jack': 11,
                     'Queen': 12,
                     'King':13,
                     'Ace': 14
                                  }
  end


  def deck_compiler
    @name_rank.each do |name, rank|
      card = Card.new(:spade, name, rank)
      card2 = Card.new(:club, name, rank)
      card3 = Card.new(:heart, name, rank)
      card4 = Card.new(:diamond, name, rank)
      @cards << card
      @cards << card2
      @cards << card3
      @cards << card4
    end

    @cards.shuffle
  end


end
