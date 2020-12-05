require './card'
require './deck'
require './player'
require './turn'

def deck_compiler

  cards = []
  name_rank = {'1': 1,
               '2': 2,
               '3': 3,
               '4': 4,
               '5': 5,
               '6': 6,
               '7': 7,
               '8': 8,
               '9': 9,
               '10': 10,
               'Jack': 11,
               'Queen': 12,
               'King':13
                            }

    name_rank.each do |name, rank|
      card = Card.new(:spade, name, rank)
      card2 = Card.new(:club, name, rank)
      card3 = Card.new(:heart, name, rank)
      card4 = Card.new(:diamond, name, rank)
      cards << card
      cards << card2
      cards << card3
      cards << card4
    end

    deck = Deck.new(cards.shuffle)


end

def start
  card = Card.new(:spade, "1", 1)
  card2 = Card.new(:club, "1", 1)
  card3 = Card.new(:heart, "1", 1)
  card4 = Card.new(:heart, "4", 4)
  cards = [card, card2, card3, card4]
  deck = Deck.new(cards)

  deck1 = deck_compiler

  player1 = Player.new("sethie", deck1)

  player2 = Player.new("jeffie", deck)

  answer = ''

  turn = Turn.new(player1, player2)

  # until answer == 'GO'
  #   puts "Welcome to War! (or Peace) This game will be played with 52 cards.
  # The players today are #{player1.name} and #{player2.name}.
  # Type 'GO' to start the game!
  # ------------------------------------------------------------------"
  #
  #   answer = gets.chomp
  # end

  until player1.has_lost? || player2.has_lost?

    turn.type
    puts "#{turn.type}"

    player1_hand = player1.deck.cards[0..2]
    player2_hand = player2.deck.cards[0..2]

    puts "#{player1.name} hand preview"
    player1_hand.each {|card| puts card.value}

    puts "#{player2.name} hand preview"
    player2_hand.each {|card| puts card.value}



    winner = turn.winner

    if winner.class == String
      puts "NO winner"
    else
      puts "#{winner.name} won this round. They will get"
    end
    # turn.spoils_of_wars.each {|war| puts war.value}
    turn.pile_cards

    turn.spoils_of_wars.each {|card| puts card.rank}

    turn.award_spoils(winner)

    player1.has_lost?
    player2.has_lost?
    # puts player1.deck




  end
  puts "wweeeee"
end

start
