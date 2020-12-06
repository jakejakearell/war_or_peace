require './card'
require './deck'
require './player'
require './turn'


def start
  card = Card.new

  deck = card.deck_compiler

  player_1_stack = deck[0..25]
  player_2_stack = deck[26..53]

  deck_half_1 = Deck.new(player_1_stack)
  deck_half_2 = Deck.new(player_2_stack)

  player1 = Player.new("sethie", deck_half_1)
  player2 = Player.new("jeffie",deck_half_2)

  turn = Turn.new(player1, player2)


  answer = ''
  # until answer == 'GO'
  #   puts "Welcome to War! (or Peace) This game will be played with 52 cards.
  # The players today are #{player1.name} and #{player2.name}.
  # Type 'GO' to start the game!
  # ------------------------------------------------------------------"
  #
  #   answer = gets.chomp
  # end

  turn_counter = 0
  until player1.has_lost? || player2.has_lost?

    turn.type

    puts "Turn #{turn_counter}:#{turn.type.capitalize}
    "

    player1_hand_preview = []
    player1_hand = player1.deck.cards[0..2]
    player1_hand.each do |card|
      player1_hand_preview << card.rank
    end
    puts "#{player1.name.capitalize} hand preview:\n#{player1_hand_preview}\n
    "

    player2_hand_preview = []
    player2_hand = player2.deck.cards[0..2]
    player2_hand.each do |card|
      player2_hand_preview << card.rank
    end
    puts "#{player2.name.capitalize} hand preview:\n#{player2_hand_preview}
    "

    winner = turn.winner
    if winner.class == String
      puts "No Winner!!"
    else
      puts "#{winner.name.capitalize} won this round. They will get:"
    end

    turn.pile_cards

    show_spoils = []
    turn.spoils_of_wars.each do |card|
      if card == nil
      else
        show_spoils <<  card.value
      end
    end
    puts "#{show_spoils}
    "

    turn.award_spoils(winner)

    puts "#{player1.name.capitalize} has #{player1.deck.cards.length} cards left"
    puts "#{player2.name.capitalize} has #{player2.deck.cards.length} cards left"
    puts "------------------------------------------------------------------"

    player1.has_lost?
    player2.has_lost?

    turn_counter += 1
    if turn_counter == 1000000
      puts "draw"
      break
    end

  end

  if player1.has_lost?
    puts "\nCongrats #{player2.name.capitalize}, after #{turn_counter} turns you win a hard fought war"
  else
    puts "\nCongrats #{player1.name.capitalize}, after #{turn_counter} turns you win a hard fought war"
  end

end

start
