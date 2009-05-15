class UpdateAdresses < ActiveRecord::Migration
  def self.up
    change_table :adresses do |t|
      t.remove :zip #had to remove because type was integer
      t.string :city
      t.rename :area, :region
      t.rename :land, :country
    end
  end

  def self.down
    change_table :adresses do |t|
      t.remove :city
      t.integer :zip
      t.rename :region, :area
      t.rename :country, :land
    end
  end
end
