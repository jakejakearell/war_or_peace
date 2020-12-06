require './card'
require './deck'
require './player'
require './turn'

def deck_compiler

  cards = []
  name_rank = {
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
               'King':13,
               'Ace': 14

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

    # deck = Deck.new(cards.shuffle)
    cards.shuffle

end

def start


  deck = deck_compiler

  player_1_stack = deck[0..25]
  player_2_stack = deck[26..53]

  deck_half_1 = Deck.new(player_1_stack)
  deck_half_2 = Deck.new(player_2_stack)

  player1 = Player.new("sethie", deck_half_1)

  player2 = Player.new("jeffie",deck_half_2)

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


    player1_hand_preview = []

    player1_hand.each do |card|
      player1_hand_preview << card.rank
    end

    puts "#{player1.name} hand preview:\n#{player1_hand_preview}\n
    "



    player2_hand = player2.deck.cards[0..2]
    player2_hand_preview = []

    player2_hand.each do |card|
      player2_hand_preview << card.rank
    end

    puts "#{player2.name} hand preview:\n#{player2_hand_preview}\n"
    puts "\n"



    winner = turn.winner

    if winner.class == String
      puts "NO winner"
    else
      puts "#{winner.name} won this round. They will get:"
    end

    turn.pile_cards

    show_spoils = []

    turn.spoils_of_wars.each do |card|
      if card == nil
        show_spoils << ''
      else
        show_spoils <<  card.rank
      end
    end

    puts "#{show_spoils}"


    turn.award_spoils(winner)

    puts "#{player1.name} has #{player1.deck.cards.length} cards left"
    puts "#{player2.name} has #{player2.deck.cards.length} cards left"

    puts "------------------------------------------------------------------"







  end
  puts "\ncongrats #{winner.name}\ntruly a titan of war "
end

start
