class Roster < ActiveRecord::Base
  has_many :rostered_players
  has_many :players, through: :rostered_palyers

  validates :qb_1, presence: true
  validates :qb_2, uniqueness: true, if: :check_team

  def week_1_total
    total = 0
    rostered_players.each do |rostered_player|
      total += rostered_player.player.week_1_score
    end
    return total
  end

  def week_2_total
    total = 0
    rostered_players.each do |rostered_player|
      total += rostered_player.player.week_2_score
    end
    return total
  end

  def week_3_total
    total = 0
    rostered_players.each do |rostered_player|
      total += rostered_player.player.week_3_score
    end
    return total
  end

  def week_4_total
    total = 0
    rostered_players.each do |rostered_player|
      total += rostered_player.player.week_4_score
    end
    return total
  end

  def roster_total
    week_1_total + week_2_total + week_3_total + week_4_total
  end

end
