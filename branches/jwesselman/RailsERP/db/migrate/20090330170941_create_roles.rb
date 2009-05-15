class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.boolean :account_read
      t.boolean :account_create
      t.boolean :account_update
      t.boolean :account_delete
      t.boolean :adress_read
      t.boolean :adress_create
      t.boolean :adress_update
      t.boolean :adress_delete
      t.boolean :caldate_read
      t.boolean :caldate_create
      t.boolean :caldate_update
      t.boolean :caldate_delete
      t.boolean :company_read
      t.boolean :company_create
      t.boolean :company_update
      t.boolean :company_delete
      t.boolean :companyart_read
      t.boolean :companyart_create
      t.boolean :companyart_update
      t.boolean :companyart_delete
      t.boolean :contact_read
      t.boolean :contact_create
      t.boolean :contact_update
      t.boolean :contact_delete
      t.boolean :dashblog_read
      t.boolean :dashblog_create
      t.boolean :dashblog_update
      t.boolean :dashblog_delete
      t.boolean :dateart_read
      t.boolean :dateart_create
      t.boolean :dateart_update
      t.boolean :dateart_delete
      t.boolean :dateprio_read
      t.boolean :dateprio_create
      t.boolean :dateprio_update
      t.boolean :dateprio_delete
      t.boolean :datestatus_read
      t.boolean :datestatus_create
      t.boolean :datestatus_update
      t.boolean :datestatus_delete
      t.boolean :datetask_read
      t.boolean :datetask_create
      t.boolean :datetask_update
      t.boolean :datetask_delete
      t.boolean :filedata_read
      t.boolean :filedata_create
      t.boolean :filedata_update
      t.boolean :filedata_delete
      t.boolean :folder_read
      t.boolean :folder_create
      t.boolean :folder_update
      t.boolean :folder_delete
      t.boolean :kbarticle_read
      t.boolean :kbarticle_create
      t.boolean :kbarticle_update
      t.boolean :kbarticle_delete
      t.boolean :kbcat_read
      t.boolean :kbcat_create
      t.boolean :kbcat_update
      t.boolean :kbcat_delete
      t.boolean :kbcomment_read
      t.boolean :kbcomment_create
      t.boolean :kbcomment_update
      t.boolean :kbcomment_delete
      t.boolean :kblang_read
      t.boolean :kblang_create
      t.boolean :kblang_update
      t.boolean :kblang_delete
      t.boolean :part_read
      t.boolean :part_create
      t.boolean :part_update
      t.boolean :part_delete
      t.boolean :product_read
      t.boolean :product_create
      t.boolean :product_update
      t.boolean :product_delete

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
