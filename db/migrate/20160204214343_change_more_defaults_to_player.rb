class ChangeMoreDefaultsToPlayer < ActiveRecord::Migration
  def change
    change_column :players, :week_2_score, :integer, :default => 0
    change_column :players, :week_3_score, :integer, :default => 0
    change_column :players, :week_4_score, :integer, :default => 0
  end
end
