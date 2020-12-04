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

    deck = Deck.new(cards)

end

def start

  deck = deck_compiler

  deck1 = deck_compiler

  player1 = Player.new("sethie", deck1)

  player2 = Player.new("jeffie", deck)

  answer = ''

  turn = Turn.new(player1, player2)

  until answer == 'GO'
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
  The players today are #{player1.name} and #{player2.name}.
  Type 'GO' to start the game!
  ------------------------------------------------------------------"

    answer = gets.chomp
  end

  until player1.has_lost? || player2.has_lost?

    turn.type
    turn.pile_cards
    winner = turn.winner
    turn.award_spoils(winner)

    puts player1.deck.cards.length




  end

end

start
