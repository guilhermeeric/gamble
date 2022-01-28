class Player < ApplicationRecord
  has_one :wallet
  has_many :bets
end
