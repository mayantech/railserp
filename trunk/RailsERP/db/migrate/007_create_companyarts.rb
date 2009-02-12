class CreateCompanyarts < ActiveRecord::Migration
  def self.up
    create_table :companyarts do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :companyarts
  end
end
