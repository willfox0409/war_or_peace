require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  before do
    # Setup cards for the interaction pattern.
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @card9 = Card.new(:diamond, '8', 8)

    # Setup decks and players for 3 different scenarios.
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)

    @deck1_war = Deck.new([@card1, @card2, @card5, @card8])
    @deck2_war = Deck.new([@card4, @card3, @card6, @card7])
    @player1_war = Player.new('Megan', @deck1_war)
    @player2_war = Player.new('Aurora', @deck2_war)

    @deck1_mad = Deck.new([@card1, @card2, @card5, @card8])
    @deck2_mad = Deck.new([@card4, @card3, @card9, @card7])
    @player1_mad = Player.new('Megan', @deck1_mad)
    @player2_mad = Player.new('Aurora', @deck2_mad)
  end

  describe '#initialize' do
    it 'creates a turn with two players and empty spoils of war' do
      turn = Turn.new(@player1, @player2)
      expect(turn.player1).to eq(@player1)
      expect(turn.player2).to eq(@player2)
      expect(turn.spoils_of_war).to eq([])
    end
  end

  describe '#type' do
    it 'returns :basic if the top cards have different ranks' do
      turn = Turn.new(@player1, @player2)
      expect(turn.type).to eq(:basic)
    end

    it 'returns :war if the top cards have the same rank' do
      turn = Turn.new(@player1_war, @player2_war)
      expect(turn.type).to eq(:war)
    end

    it 'returns :mutually_assured_destruction if both the top and third cards have the same rank' do

      turn = Turn.new(@player1_mad, @player2_mad)
      expect(turn.type).to eq(:mutually_assured_destruction)
    end
  end

  describe '#winner' do
    it 'returns the player with the higher rank card in :basic turn' do
      turn = Turn.new(@player1, @player2)
      expect(turn.winner).to eq(@player1)
    end

    it 'returns the player with the higher third card in :war turn' do
      turn = Turn.new(@player1_war, @player2_war)
      expect(turn.winner).to eq(@player2_war)
    end

    it 'returns "No Winner" for :mutually_assured_destruction' do
      turn = Turn.new(@player1_mad, @player2_mad)
      expect(turn.winner).to eq('No Winner')
    end
  end

  describe '#pile_cards' do
    it 'sends one card from each player to spoils for :basic turn' do
      turn = Turn.new(@player1, @player2)
      turn.pile_cards
      expect(turn.spoils_of_war).to match_array([@card1, @card3]) # Use ,to match_array[] method instead of .to eq
    end

    it 'sends three cards from each player to spoils for :war turn' do
      turn = Turn.new(@player1_war, @player2_war)
      turn.pile_cards
      expect(turn.spoils_of_war).to match_array([@card1, @card5, @card4, @card2, @card3, @card6])
    end

    it 'removes three cards from each player in :mutually_assured_destruction turn' do
      turn = Turn.new(@player1_mad, @player2_mad)
      turn.pile_cards
      expect(@player1_mad.deck.cards).to eq([@card8])
      expect(@player2_mad.deck.cards).to eq([@card7])
      expect(turn.spoils_of_war).to eq([])
    end
  end

  describe '#award_spoils' do
    it 'awards the spoils to the winner and clears the spoils of war array' do
      turn = Turn.new(@player1_war, @player2_war)
      turn.pile_cards
      winner = turn.winner
      turn.award_spoils(winner)
      expect(@player1_war.deck.cards).to eq([@card8])
      expect(turn.spoils_of_war).to eq([])
    end
  end
end
