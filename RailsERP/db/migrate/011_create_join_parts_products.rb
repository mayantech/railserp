class CreateJoinPartsProducts < ActiveRecord::Migration
  def self.up
    create_table :parts_products, :id => false do |t|
      t.integer :part_id
      t.integer :product_id
    end
  end

  def self.down
   drop_table :parts_products
  end

end
