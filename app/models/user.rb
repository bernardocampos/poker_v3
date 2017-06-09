class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :timeoutable, :timeout_in => 2880.minutes
  has_many :players, :dependent => :destroy
  has_many :tables, :through => :players

  validates :username, :presence => true
  validates :username, :uniqueness => true

end
