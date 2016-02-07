class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :position
      t.integer :week_1_score
      t.integer :week_2_score
      t.integer :week_3_score
      t.integer :week_4_score

      t.timestamps
    end
  end
end
