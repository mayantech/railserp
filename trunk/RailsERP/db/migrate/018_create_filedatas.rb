class CreateFiledatas < ActiveRecord::Migration
  def self.up
    create_table :filedatas do |t|
      t.string :name
      t.string :ext
      t.float :size
      t.text :info
      t.integer :contact_id
      t.integer :folder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :filedatas
  end
end
