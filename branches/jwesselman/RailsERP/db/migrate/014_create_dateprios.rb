class CreateDateprios < ActiveRecord::Migration
  def self.up
    create_table :dateprios do |t|
      t.string :prio

      t.timestamps
    end
  end

  def self.down
    drop_table :dateprios
  end
end
