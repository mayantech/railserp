class AddcompanyartIdTocompany < ActiveRecord::Migration
  def self.up
  add_column :companies, :companyart_id, :integer
  end

  def self.down
    remove_column :companies, :companyart_id
  end
end