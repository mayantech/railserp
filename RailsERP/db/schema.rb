# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090331184918) do

  create_table "accounts", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "role_id"
    t.boolean  "is_admin"
  end

  create_table "adresses", :force => true do |t|
    t.string   "street"
    t.string   "streetnr"
    t.integer  "zip"
    t.string   "area"
    t.string   "land"
    t.string   "postcode"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "caldates", :force => true do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.text     "info"
    t.boolean  "fullday"
    t.integer  "account_id"
    t.integer  "contact_id"
    t.integer  "dateprio_id"
    t.integer  "datestatus_id"
    t.integer  "dateart_id"
    t.datetime "reminder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "companyart_id"
  end

  create_table "companyarts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "position"
    t.string   "tel"
    t.string   "mobile"
    t.string   "email"
    t.text     "Info"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "dashblogs", :force => true do |t|
    t.string   "title"
    t.text     "blogtext"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datearts", :force => true do |t|
    t.string   "art"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dateprios", :force => true do |t|
    t.string   "prio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datestatuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datetasks", :force => true do |t|
    t.string   "taskname"
    t.text     "info"
    t.integer  "progressed"
    t.integer  "dateprio_id"
    t.integer  "datestatus_id"
    t.integer  "caldate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filedatas", :force => true do |t|
    t.string   "name"
    t.string   "ext"
    t.float    "size"
    t.text     "info"
    t.integer  "contact_id"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kbarticles", :force => true do |t|
    t.text     "symptoms"
    t.text     "cause"
    t.text     "solution"
    t.integer  "kbcat_id"
    t.integer  "kblang_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kbcats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kbcomments", :force => true do |t|
    t.integer  "kbarticle_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kblangs", :force => true do |t|
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.text     "info"
    t.string   "imagename"
    t.string   "imageext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts_products", :id => false, :force => true do |t|
    t.integer "part_id"
    t.integer "product_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.text     "info"
    t.string   "imagepath"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.boolean  "account_read"
    t.boolean  "account_create"
    t.boolean  "account_update"
    t.boolean  "account_delete"
    t.boolean  "adress_read"
    t.boolean  "adress_create"
    t.boolean  "adress_update"
    t.boolean  "adress_delete"
    t.boolean  "caldate_read"
    t.boolean  "caldate_create"
    t.boolean  "caldate_update"
    t.boolean  "caldate_delete"
    t.boolean  "company_read"
    t.boolean  "company_create"
    t.boolean  "company_update"
    t.boolean  "company_delete"
    t.boolean  "companyart_read"
    t.boolean  "companyart_create"
    t.boolean  "companyart_update"
    t.boolean  "companyart_delete"
    t.boolean  "contact_read"
    t.boolean  "contact_create"
    t.boolean  "contact_update"
    t.boolean  "contact_delete"
    t.boolean  "dashblog_read"
    t.boolean  "dashblog_create"
    t.boolean  "dashblog_update"
    t.boolean  "dashblog_delete"
    t.boolean  "dateart_read"
    t.boolean  "dateart_create"
    t.boolean  "dateart_update"
    t.boolean  "dateart_delete"
    t.boolean  "dateprio_read"
    t.boolean  "dateprio_create"
    t.boolean  "dateprio_update"
    t.boolean  "dateprio_delete"
    t.boolean  "datestatus_read"
    t.boolean  "datestatus_create"
    t.boolean  "datestatus_update"
    t.boolean  "datestatus_delete"
    t.boolean  "datetask_read"
    t.boolean  "datetask_create"
    t.boolean  "datetask_update"
    t.boolean  "datetask_delete"
    t.boolean  "filedata_read"
    t.boolean  "filedata_create"
    t.boolean  "filedata_update"
    t.boolean  "filedata_delete"
    t.boolean  "folder_read"
    t.boolean  "folder_create"
    t.boolean  "folder_update"
    t.boolean  "folder_delete"
    t.boolean  "kbarticle_read"
    t.boolean  "kbarticle_create"
    t.boolean  "kbarticle_update"
    t.boolean  "kbarticle_delete"
    t.boolean  "kbcat_read"
    t.boolean  "kbcat_create"
    t.boolean  "kbcat_update"
    t.boolean  "kbcat_delete"
    t.boolean  "kbcomment_read"
    t.boolean  "kbcomment_create"
    t.boolean  "kbcomment_update"
    t.boolean  "kbcomment_delete"
    t.boolean  "kblang_read"
    t.boolean  "kblang_create"
    t.boolean  "kblang_update"
    t.boolean  "kblang_delete"
    t.boolean  "part_read"
    t.boolean  "part_create"
    t.boolean  "part_update"
    t.boolean  "part_delete"
    t.boolean  "product_read"
    t.boolean  "product_create"
    t.boolean  "product_update"
    t.boolean  "product_delete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rolename"
  end

end
