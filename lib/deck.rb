class Deck
  attr_accessor :cards, :high

  def initialize(cards)
    @cards = cards
    @high = []
  end

  def rank_of_card_at(index_number)
    @cards[index_number].rank
  end

  def high_ranking_cards
    @cards.each do |card|
      if card.rank >= 11
        @high.insert(-1, card)
      end
    end
    @high
  end

  def percent_high_ranking
    self.high_ranking_cards
    ((@high.length*1.00)/@cards.length) *100.00

  end

  def remove_card(card='')
    if card == ''
      @cards.delete_at(0)
    else
      @cards.delete(card)
    end
  end

  def add_card(card)
    @cards.insert(-1, card)
  end
end
