require 'rspec'
require './lib/card'

RSpec.describe Card do
  describe '#initialize' do # should split these tests up before Tuesday
    it 'creates a card with a suit, value, and rank' do
      card = Card.new(:hearts, 'Jack', 11)

      expect(card.suit).to eq(:hearts)
      expect(card.value).to eq('Jack')
      expect(card.rank).to eq(11)
    end
  end

  describe '#to_s' do # not in the interaction pattern, unnecessary artifact?
    it 'returns correct string representation of given card' do
      card = Card.new('Hearts', 'Jack', 11)

      expect(card.to_s).to eq('Jack of Hearts, 11')
    end
  end
end
