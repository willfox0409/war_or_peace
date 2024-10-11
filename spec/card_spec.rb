require 'rspec'
require relative '../card'

RSpec.describe Card do
  describe '#initialize' do
  it 'creates a card with a suit, value, and rank' do
    card = Card.new(:hearts, "king", 13)

    expect(card.suit).to eq("hearts")
    expect(card.value).to eq("King")
    expect(card.rank).to eq(13)
  end
end

  describe '#to_s' do
  it 'returns correct string representation of given card'
    card = Card.new(:hearts, 'King', 13)

    expect(card.to_s).to eq("King of Hearts, 13")
  end
 end
end
