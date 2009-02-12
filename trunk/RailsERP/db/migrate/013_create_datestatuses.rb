class CreateDatestatuses < ActiveRecord::Migration
  def self.up
    create_table :datestatuses do |t|
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :datestatuses
  end
end
