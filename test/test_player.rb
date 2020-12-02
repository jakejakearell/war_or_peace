require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_name
    player = Player.new("Jeff", 'nada')
    name = "Jeff"
    assert_equal name, player.name
  end

  def test_has_deck?

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, '5', 5)
    deck = Deck.new([card1, card2, card3])

    player = Player.new("jeffe", deck)

    assert_equal deck, player.deck

  end

  def test_has_lost_false_at_start
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, '5', 5)
    card4 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)

    player = Player.new("Jeff", deck)
    # require 'pry'; binding.pry
    refute player.has_lost?
  end

  def test_loses_if_deck_empty
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, '5', 5)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)


    player = Player.new("Jeff", deck)



    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    player.has_lost?

    assert_equal player.has_lost, true

end

  def test_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, '5', 5)
    deck = Deck.new([card1, card2, card3])

    player = Player.new("jeffe", deck)

    player.deck.remove_card
    player.deck.remove_card


    assert_equal player.deck.cards, [card3]

  end

end
