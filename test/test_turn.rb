require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '1', 1)
    @card3 = Card.new(:heart, '5', 5)
    @card4 = Card.new(:diamond, 'Ace', 14)
    @card5 = Card.new(:spade, '8', 8)
    @card6 = Card.new(:heart, '1', 1)
    @card7 = Card.new(:diamond, '8', 8)
    @card8 = Card.new(:heart, 'Jack', 11)

    @cards1 = [@card1, @card7, @card3, @card8]
    @cards2 = [@card5, @card6, @card2, @card4]


    @deck1 = Deck.new(@cards1)
    @deck2 = Deck.new(@cards2)

    @player1 = Player.new("jeff", @deck1)
    @player2 = Player.new("jeff", @deck2)

    @turn = Turn.new(@player1, @player2)

  end


  def test_it_has_readable_attributes

    assert_equal @player1, @turn.player1
    assert_equal  @player2, @turn.player2

    assert_equal [], @turn.spoils_of_wars

  end


  def test_turn_type_basic

    assert_equal :basic, @turn.type

  end

  def test_turn_type_war

    cards1 = [@card2, @card1, @card7, @card8]
    cards2 = [@card6, @card3, @card4, @card5]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new("seth", deck1)
    player2 = Player.new("jeedd", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type

  end

  def test_turn_type_mutually_assured_destruction
    #mutually_assured_destruction is shortened to mad
    cards1 = [@card2, @card1, @card7, @card8]
    cards2 = [@card6, @card3, @card5, @card4]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new("seth", deck1)
    player2 = Player.new("jeedd", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type

  end

  def test_winner_basic

    assert_equal @player1, @turn.winner

  end

  def test_winner_war

    cards1 = [@card2, @card1, @card7, @card8]
    cards2 = [@card6, @card3, @card4, @card5]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new("seth", deck1)
    player2 = Player.new("jeedd", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner

  end

  def test_winner_mad
    cards1 = [@card2, @card1, @card7, @card8]
    cards2 = [@card6, @card3, @card5, @card4]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new("seth", deck1)
    player2 = Player.new("jeedd", deck2)
    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_card_pile_basic
    @turn.pile_cards
    assert_equal [@card1, @card5], @turn.spoils_of_wars

  end

  def test_card_pile_war

    cards1 = [@card2, @card1, @card7, @card8]
    cards2 = [@card6, @card3, @card4, @card5]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new("seth", deck1)
    player2 = Player.new("jeedd", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards
    cards = [@card2, @card1, @card7, @card6, @card3, @card4]

    assert_equal cards , turn.spoils_of_wars

  end

  def test_card_pile_mad

    cards1 = [@card2, @card1, @card7, @card8]
    cards2 = [@card6, @card3, @card5, @card4]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new("seth", deck1)
    player2 = Player.new("jeedd", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [@card8], turn.player1.deck.cards
    assert_equal [@card4], turn.player2.deck.cards


  end

  def test_award_spoils_basic

    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)



    assert_equal [@card7, @card3, @card8, @card1, @card5], @turn.player1.deck.cards
    assert_equal [@card6, @card2, @card4], @turn.player2.deck.cards

  end

  def test_award_spoils_war

    cards1 = [@card2, @card1, @card7, @card8]
    cards2 = [@card6, @card3, @card4, @card5]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new("seth", deck1)
    player2 = Player.new("jeedd", deck2)
    turn = Turn.new(player1, player2)

    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    cards = [@card5, @card2, @card1, @card7, @card6, @card3, @card4]

    assert_equal cards, turn.player2.deck.cards






  end




end
