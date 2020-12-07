require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, '5', 5)
    @card4 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3, @card4]
    @deck = Deck.new(@cards)

    @player = Player.new("Jeff", @deck)

  end

  def test_name
    name = "Jeff"
    assert_equal name, @player.name

  end

  def test_has_deck?

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, '5', 5)
    card6 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3, card6]
    deck = Deck.new(cards)
    player = Player.new("John", deck)


    assert_equal deck, player.deck

  end

  def test_has_lost_false_at_start
    refute @player.has_lost?

  end

  def test_remove_card
    @player.deck.remove_card

    assert_equal @player.deck.cards.length, 3
    assert_equal @card2, @player.deck.cards[0]

  end

  def test_loses_if_deck_empty
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card
    @player.has_lost?

    assert_equal @player.has_lost, true

  end



end
