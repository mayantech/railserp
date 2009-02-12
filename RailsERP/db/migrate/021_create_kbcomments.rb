class CreateKbcomments < ActiveRecord::Migration
  def self.up
    create_table :kbcomments do |t|
      t.integer :kbarticle_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :kbcomments
  end
end
