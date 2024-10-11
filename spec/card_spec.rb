require 'rspec'
require relative './lib/card'

RSpec.describe Card do
  it 'creates a card with a suit, value, and rank' do
    card = Card.new(:diamond, "Queen", 12)

    expect(card.suit).to eq("diamond")
    expect(card.value).to eq("Queen")
  end

  it "returns a string description of the card" do
    card = Card.new(:diamond, 'Queen', 12)


  end
end
