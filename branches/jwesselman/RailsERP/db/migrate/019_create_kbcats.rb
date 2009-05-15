class CreateKbcats < ActiveRecord::Migration
  def self.up
    create_table :kbcats do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :kbcats
  end
end
