class Table < ApplicationRecord
  has_many :players
  has_many :users, :through => :players
  serialize :winners, Array
  serialize :winnings, Array
  serialize :winning_hands, Array
end
