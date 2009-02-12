class CreateDashblogs < ActiveRecord::Migration
  def self.up
    create_table :dashblogs do |t|
      t.string :title
      t.text :blogtext
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :dashblogs
  end
end
