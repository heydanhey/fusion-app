class Player < ActiveRecord::Base
  has_many :rostered_players
  has_many :rosters, through: :rostered_players

  def name_and_team
    name + ", " + team
  end

  def name_and_position_and_team
    name + ", " + position + ", " + team
  end


end