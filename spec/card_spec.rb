require 'rspec'
require './lib/card.rb'

RSpec.describe Card do
  describe '#initialize' do
  it 'creates a card with a suit, value, and rank' do
    card = Card.new("hearts", "king", 13)

    expect(card.suit).to eq("hearts")
    expect(card.value).to eq("king")
    expect(card.rank).to eq(13)
  end
end

  describe '#to_s' do
  it 'returns correct string representation of given card' do
    card = Card.new("Hearts", "King", 13)

    expect(card.to_s).to eq("King of Hearts, 13")
  end
 end
end 

