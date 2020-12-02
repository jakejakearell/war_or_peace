require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class PlayerTest < Minitest::Test
  def test_name
    player = Player.new("Jeff")
    name = "Jeff"
    assert_equal name, player.name
  end

  def test_has_deck?

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, '5', 5)
    deck = Deck.new([card1, card2, card3,])

    player = Player.new("jeffe", deck)

    assert_equal deck, player.deck

  end 

  def test_has_lost?
    player = Player.new("Jeff")
    refute player.has_lost?
  end
end
