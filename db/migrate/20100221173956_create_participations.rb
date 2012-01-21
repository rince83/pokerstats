class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.references :tournament
      t.references :player
      t.integer :placement
      t.integer :number_of_rebuys
      t.integer :number_of_addons
      t.decimal :money_won

      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
