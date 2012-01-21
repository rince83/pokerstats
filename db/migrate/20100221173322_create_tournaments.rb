class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.date :date
      t.integer :buyin_cost
      t.integer :rebuy_cost
      t.integer :addon_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
