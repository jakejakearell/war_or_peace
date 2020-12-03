require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, '5', 5)
    @card4 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3, @card4]
    @deck = Deck.new(@cards)
  end

  def test_rank

    assert_equal 12, @deck.rank_of_card_at(0)
  end

  def test_highest_rank

    assert_equal [@card1, @card4], @deck.high_ranking_cards

  end

  def test_percent

    assert_equal 50.0, @deck.percent_high_ranking

  end
#
  def test_remove

    @deck.remove_card(@card4)

    assert_equal @deck.cards, [@card1, @card2, @card3]

  end

  def test_add

    card5 = Card.new(:heart, '6', 6)

    @deck.add_card(card5)

    assert_equal @deck.cards, [@card1, @card2, @card3, @card4, card5]
  end

end
