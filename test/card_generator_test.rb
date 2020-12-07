require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    deck = CardGenerator.new
    assert_instance_of CardGenerator, deck
  end

  def test_it_has_attributes
  end

  def test_it_can_have_different_attributes
  end

end
