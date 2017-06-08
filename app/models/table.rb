class Table < ApplicationRecord
  has_many :players, :dependent => :destroy
  has_many :users, :through => :players, :source => :user
  serialize :winners, Array
  serialize :winnings, Array
  serialize :winning_hands, Array

  validates :small_blind, :numericality => { :greater_than => 0 }
  validates :small_blind, :presence => true
  validates :pot, :numericality => { :greater_than_or_equal_to => 0 }
  validates :password, :length => { :minimum => 6, :maximum => 14 }
  validates :password, :presence => true
  validates :name, :presence => true
  validates :buy_in, :numericality => { :greater_than => 0 }
  validates :buy_in, :presence => true
  validates :big_blind, :numericality => { :greater_than => 0 }
  validates :big_blind, :presence => true
end
