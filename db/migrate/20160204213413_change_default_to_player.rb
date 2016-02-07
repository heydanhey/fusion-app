class ChangeDefaultToPlayer < ActiveRecord::Migration
  def change
    change_column :players, :week_1_score, :integer, :default => 0
  end
end
