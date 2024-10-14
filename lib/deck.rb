class Deck 
    attr_reader :cards 
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index) #define a method called 'rank_of_card_at', that takes one argument 'index'
    card = @cards[index]     #access the card at the given 'index' from the '@cards' array and assign it to the 'card' variable 
    card ? card.rank : nil
  end

  def high_ranking_cards        #define a method called 'high ranking cards'
    @cards.find_all do |card|   #conduct the .find_all method on the @cards array
        card.rank >= 11         #use the .rank method on the card array 
    end
  end

   def percent_high_ranking
    high_cards_count = @cards.find_all { |card| card.rank >= 11 }.count
    (high_cards_count.to_f / @cards.count * 100).round(2)
    end 

    def remove_card
    @cards.shift  #.empty = built-in Ruby array method to check if array is empty
    end

    def add_card(card)
    @cards.push(card)   # can also use this (<<) method instead of '.push'
    end
end

