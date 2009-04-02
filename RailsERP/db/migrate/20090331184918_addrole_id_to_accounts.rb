class AddroleIdToAccounts < ActiveRecord::Migration
  def self.up
   add_column :accounts, :role_id, :integer
   add_column :accounts, :is_admin, :boolean
  end

  def self.down
   remove_column :accounts, :role_id
   remove_column :accounts, :is_admin
  end
end
