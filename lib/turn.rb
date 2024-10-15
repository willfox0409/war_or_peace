class Turn 
  attr_reader :player1, :player2, :spoils_of_war

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&  
       player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
    elsif  
      player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    else
      :war
    end
  end

  def winner
    if type == :basic
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war && player1.deck.cards.size >= 3 && player2.deck.cards.size >= 3
      player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      card1 = player1.deck.remove_card  #Each player removes card from top of pile
      card2 = player2.deck.remove_card  
      @spoils_of_war.push(card1, card2) #Add both cards to spoils_of_war
    elsif type == :war
      3.times do
        card1 = player1.deck.remove_card  #Remove a card from player1
        card2 = player2.deck.remove_card  #Remove a card from player2
        @spoils_of_war.push(card1, card2) #Add both cards to spoils_of_war (total of 3 for each player)
      end
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card  #Remove a card from player1 (no spoils)
        player2.deck.remove_card  #Remove a card from player2 (no spoils)
      end
    end
  end

  def award_spoils(winner)
    if winner != "No Winner"
      @spoils_of_war.each do |card|   #Iterate through each card in spoils_of_war with .each
        winner.deck.cards.push(card)  #Add each card to the winner's deck with .push
      end
      @spoils_of_war.clear  #Clear the spoils after awarding them with .clear method
        
    end  
  end
end