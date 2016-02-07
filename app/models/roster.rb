class Roster < ActiveRecord::Base
  has_many :rostered_players
  has_many :players, through: :rostered_palyers

end
