class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :user_id
      t.string :team_name
      t.integer :qb_1
      t.integer :qb_2
      t.integer :rb_1
      t.integer :rb_2
      t.integer :rb_3
      t.integer :wr_1
      t.integer :wr_2
      t.integer :wr_3
      t.integer :te_1
      t.integer :k_1
      t.integer :k_2
      t.integer :d_1
      t.integer :flex_1

      t.timestamps null: false
    end
  end
end
