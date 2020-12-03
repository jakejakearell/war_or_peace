require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_instance_of_turn
    turn = Turn.new

    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    turn = Turn.new("player1", "player2", "spoils_of_wars")

    assert_equal "player1", turn.player1
    assert_equal "player2", turn.player2
    assert_equal "spoils_of_wars", turn.spoils_of_wars

  end



  


end
