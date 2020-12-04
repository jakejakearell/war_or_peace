class Turn
  attr_reader :player1, :player2, :spoils_of_wars

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_wars = []
  end

  def type

    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank  == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    else
      :basic
    end
  end

  def winner

    if self.type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end

    elsif self.type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      else
        @player2
      end

    else
      "No Winner"

    end
  end

  def pile_cards
    if self.type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)

    elsif self.type == :war
      3.times do
        @spoils_of_wars << @player1.deck.cards.shift
      end

      3.times do
        @spoils_of_wars << @player2.deck.cards.shift
      end

    else
      spoil = @player1.deck.cards.shift
      spoil2 = @player2.deck.cards.shift
      @spoils_of_wars << spoil
      @spoils_of_wars << spoil2

    end


  end

  def award_spoils(winner)
    @spoils_of_wars.each do |spoil|
      winner.deck.cards << spoil
    end

    @spoils_of_wars = []
  end
end
