class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index_number)
    if @cards[index_number] == nil
      0
    else
      @cards[index_number].rank
    end
  end

  def high_ranking_cards
    high = []
    @cards.each do |card|
      if card.rank >= 11
        high.insert(-1, card)
      end
    end
    high
  end

  def percent_high_ranking_cards
    high = self.high_ranking_cards

    ((high.length*1.00)/@cards.length) *100.00

  end

  def remove_card
      @cards.delete_at(0)
  end

  def add_card(card)
    @cards.insert(-1, card)
  end
end
