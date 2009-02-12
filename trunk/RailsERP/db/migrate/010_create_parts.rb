class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :name
      t.float :price
      t.text :info
      t.string :imagename
      t.string :imageext

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
