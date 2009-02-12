class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :position
      t.string :tel
      t.string :mobile
      t.string :email
      t.text :Info
      t.date :birthday

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
