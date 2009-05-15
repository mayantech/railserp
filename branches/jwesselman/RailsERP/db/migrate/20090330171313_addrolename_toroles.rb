class AddrolenameToroles < ActiveRecord::Migration
  def self.up
  add_column :roles, :rolename, :string
  end

  def self.down
  remove_column :roles, :rolename
  end
end
