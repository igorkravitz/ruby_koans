# frozen_string_literal: true

# def score(dice)
#   # You need to write this method
#   return 0 if dice.empty?

#   sc = 0
#   h = dice.each_with_object(Hash.new(0)) { |i, hash| hash[i] += 1 }
#   # h.each_pair do |key, value|
#   #   sc += case key
#   #         when 1
#   #           key >= 3 ? 1000 : 0 + ((value - 3) * 100)
#   #         when 5
#   #           key >= 3 ? 300 : 0 + ((value - 3) * 50)
#   #         else
#   #           value > 1 ? 100 * key : 0
#   #         end
#   # end
#   p h
#   p sc
#   sc
# end

# p score([5, 5, 5, 3, 3])

# class DiceSet
class DiceSet < Hash
  attr_accessor :hash

  def initialize
    @hash = super
  end

  def roll(length)
    # @hash = {}
    @hash.each_key { |key| @hash.delete(key) }
    (1..length).each { |n| @hash[n] = rand(1..6) }
  end
end

def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
  dice = DiceSet.new

  dice.roll(5)
  p dice.values.is_a?(Array)
  p dice.values.size == 5
  dice.each_value do |value|
    p value >= 1 && value <= 6 # , "value #{value} must be between 1 and 6"
  end
end

def test_you_can_roll_different_numbers_of_dice
  dice = DiceSet.new

  dice.roll(3)
  p dice.values.size == 3

  dice.roll(1)
  p dice.values.size == 1
end

# test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
test_you_can_roll_different_numbers_of_dice
