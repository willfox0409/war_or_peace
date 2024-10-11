class Card
    attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank 
  end 

  def to_s
    "#{value.capitalize} of #{suit.capitalize}, #{rank})"
  end
end