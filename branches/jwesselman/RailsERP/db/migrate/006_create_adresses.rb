class CreateAdresses < ActiveRecord::Migration
  def self.up
    create_table :adresses do |t|
      t.string :street
      t.string :streetnr
      t.integer :zip
      t.string :area
      t.string :land
      t.string :postcode
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :adresses
  end
end
