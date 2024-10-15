require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  describe '#initialize' do
    it 'creates a deck with an array of cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      expect(deck.cards).to eq([card1, card2, card3])
    end
  end

  describe '#rank_of_card_at' do
    it 'returns the rank of card at the given index position' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(1)).to eq(3)
      expect(deck.rank_of_card_at(2)).to eq(14)
      expect(deck.rank_of_card_at(3)).to be_nil
    end
  end

  describe '#high_ranking_cards' do
    it 'returns only the cards with rank 11 or higher' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe '#percent_high_ranking' do
    it 'returns the percentage of high-ranking cards to' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe '#remove_card' do
    it 'removes the first card from the deck and returns it' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      expect(deck.remove_card).to eq(card1)
      expect(deck.cards).to eq([card2, card3])
      expect(deck.remove_card).to eq(card2)
      expect(deck.cards).to eq([card3])

      deck.remove_card # Deck should be empty
      expect(deck.cards).to eq([])
    end
  end

  describe '#add_card' do
    it 'adds a new card to the bottom of the deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])

      card4 = Card.new(:club, '5', 5)

      deck.add_card(card4)
      expect(deck.cards).to eq([card1, card2, card3, card4])
    end
  end
end
