class CreateDatetasks < ActiveRecord::Migration
  def self.up
    create_table :datetasks do |t|
      t.string :taskname
      t.text :info
      t.integer :progressed
      t.integer :dateprio_id
      t.integer :datestatus_id
      t.integer :caldate_id

      t.timestamps
    end
  end

  def self.down
    drop_table :datetasks
  end
end
