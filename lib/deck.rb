class Deck 
    attr_reader :cards 
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index) #define a method called 'rank_of_card_at', that takes one argument 'index'
    card = @cards[index]     #access the card at the given 'index' from the '@cards' array and assign it to the 'card' variable 
    card ? card.rank : nil
  end

  def high_ranking_cards 
    @cards.find_all do |card|
        card.rank >= 11
    end
  end

   def percent_high_ranking
    percent_high_card = @cards.find_all do |card|
        card.rank >= 11
    end
   (percent_high_card.to_f / @cards.count * 100).round(2)
    end 
end

