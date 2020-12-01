class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_number)
    @cards[index_number].rank
  end

  def high_ranking_cards(card)
    card
  end

  def percent_high_ranking(card)
    card
  end

  def remove_card(card)
    card
  end

  def add_card(card)
    card
  end
end
