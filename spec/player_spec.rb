require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'creates a player with a name and a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
    end
  end

  describe '#has_lost?' do
    it 'returns false if the player still has cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)
    end

    it 'returns true if the player has no cards left' do
      deck = Deck.new([])
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(true)
    end

    it 'updates the status as cards are removed from the deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      expect(player.has_lost?).to eq(true)
    end
  end
end
