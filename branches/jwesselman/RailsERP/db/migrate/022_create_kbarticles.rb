class CreateKbarticles < ActiveRecord::Migration
  def self.up
    create_table :kbarticles do |t|
      t.text :symptoms
      t.text :cause
      t.text :solution
      t.integer :kbcat_id
      t.integer :kblang_id

      t.timestamps
    end
  end

  def self.down
    drop_table :kbarticles
  end
end
