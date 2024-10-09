class Card
    attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank 
  end 

  def to_s
    "#{value} of #{suit.capitalize} (Rank: #{rank})"
  end
end