class Roster < ActiveRecord::Base
  has_many :rostered_players
  has_many :players, through: :rostered_palyers

  validates :qb_1, presence: true
  validates :qb_2, presence: true

  # def all_teams
  #   return ["ARI", "CAR", "CIN", "DEN", "GB", "HOU", "KC", "MIN", "NE", "PIT", "SEA", "WAS"]
  # end

end
