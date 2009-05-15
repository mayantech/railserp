class CreateCaldates < ActiveRecord::Migration
  def self.up
    create_table :caldates do |t|
      t.datetime :startdate
      t.datetime :enddate
      t.text :info
      t.boolean :fullday
      t.integer :account_id
      t.integer :contact_id
      t.integer :dateprio_id
      t.integer :datestatus_id
      t.integer :dateart_id
      t.datetime :reminder

      t.timestamps
    end
  end

  def self.down
    drop_table :caldates
  end
end
