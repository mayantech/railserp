class CreateKblangs < ActiveRecord::Migration
  def self.up
    create_table :kblangs do |t|
      t.string :language

      t.timestamps
    end
  end

  def self.down
    drop_table :kblangs
  end
end
