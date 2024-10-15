class Turn 
    attr_reader :player1, :player2, :spoils_of_war

    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = spoils_of_war = []
    end

    def type
        if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            :basic
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
              player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        else
            :war
    end
  end

  def winner
        if type ==:basic
            player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    else
      "No Winner"
        end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card << player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card << player2.deck.remove_card
      end
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(@spoils_of_war) unless winner == "No Winner"
    @spoils_of_war.clear
  end
end