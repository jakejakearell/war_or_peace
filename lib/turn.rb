class Turn
  attr_reader :player1, :player2, :spoils_of_wars

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_wars = []

  end

  def type_of_turn
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2)  == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end

  end

  def winner
    if self.type_of_turn == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end

    elsif self.type_of_turn == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end

    else
      "No Winner"

    end
  end

  def pile_cards
    if self.type_of_turn == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)

    elsif self.type_of_turn == :war
      3.times do
        @spoils_of_wars << @player1.deck.cards.shift
      end

      3.times do
        @spoils_of_wars << @player2.deck.cards.shift
      end

    else
      spoil1 = @player1.deck.cards.shift
      @spoils_of_wars << spoil1

      spoil2 = @player2.deck.cards.shift
      @spoils_of_wars << spoil2

    end


  end

  def award_spoils(winner)
    @spoils_of_wars.shuffle.each do |spoil|
      if spoil == nil
        0
      else
        winner.deck.cards << spoil
      end
    end
    @spoils_of_wars = []

  end
end
