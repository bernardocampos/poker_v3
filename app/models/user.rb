class User < ApplicationRecord
  has_many :players
  has_many :tables, :through => :players

end
