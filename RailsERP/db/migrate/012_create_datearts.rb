class CreateDatearts < ActiveRecord::Migration
  def self.up
    create_table :datearts do |t|
      t.string :art

      t.timestamps
    end
  end

  def self.down
    drop_table :datearts
  end
end
