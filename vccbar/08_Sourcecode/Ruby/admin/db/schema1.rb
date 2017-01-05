# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema1.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 1) do

  create_table "d_category", primary_key: "category_id", force: :cascade do |t|
    t.string   "category_name", limit: 255,                 null: false
    t.boolean  "del_flg",                   default: false, null: false
    t.datetime "created_date",                              null: false
    t.datetime "modified_date",                             null: false
    t.integer  "created_by",    limit: 4,                   null: false
    t.integer  "modified_by",   limit: 4,                   null: false
  end

  create_table "d_customer", primary_key: "customer_id", force: :cascade do |t|
    t.string   "username",      limit: 255,                 null: false
    t.string   "password",      limit: 50,                  null: false
    t.string   "first_name",    limit: 255,                 null: false
    t.string   "last_name",     limit: 255,                 null: false
    t.date     "birthday"
    t.string   "email",         limit: 255,                 null: false
    t.string   "phone",         limit: 20
    t.boolean  "del_flg",                   default: false, null: false
    t.datetime "created_date",                              null: false
    t.datetime "modified_date",                             null: false
    t.datetime "del_date"
    t.integer  "del_by",        limit: 4
  end

  create_table "d_import", primary_key: "import_id", force: :cascade do |t|
    t.string   "title",         limit: 255,                                null: false
    t.string   "code",          limit: 50
    t.date     "date",                                                     null: false
    t.decimal  "total_grand",               precision: 10, default: 0,     null: false
    t.boolean  "import_stock",                             default: false, null: false
    t.datetime "created_date",                                             null: false
    t.datetime "modified_date",                                            null: false
    t.integer  "created_by",    limit: 4,                                  null: false
    t.integer  "modified_by",   limit: 4,                                  null: false
  end

  create_table "d_import_item", primary_key: "import_item_id", force: :cascade do |t|
    t.integer  "import_id",    limit: 4,                            null: false
    t.integer  "product_id",   limit: 4,                            null: false
    t.decimal  "price",                  precision: 10, default: 0, null: false
    t.integer  "quantity",     limit: 4,                default: 0, null: false
    t.decimal  "total_grand",            precision: 10,             null: false
    t.datetime "created_date",                                      null: false
  end

  create_table "d_order", primary_key: "order_id", force: :cascade do |t|
    t.integer  "customer_id",    limit: 4,                                 null: false
    t.string   "customer_name",  limit: 255,                               null: false
    t.string   "customer_email", limit: 255,                               null: false
    t.string   "customer_phone", limit: 20
    t.string   "coupon_code",    limit: 50
    t.decimal  "total_price",                precision: 10, default: 0,    null: false
    t.decimal  "discount",                   precision: 10, default: 0,    null: false
    t.decimal  "total_grand",                precision: 10, default: 0,    null: false
    t.boolean  "status",                                    default: true, null: false
    t.datetime "created_date",                                             null: false
    t.datetime "modified_date"
    t.integer  "modified_by",    limit: 4
  end

  create_table "d_order_item", primary_key: "order_item_id", force: :cascade do |t|
    t.integer  "order_id",     limit: 4,                                null: false
    t.integer  "product_id",   limit: 4,                                null: false
    t.boolean  "quantity",                              default: false, null: false
    t.decimal  "price",                  precision: 10, default: 0,     null: false
    t.decimal  "total_grand",            precision: 10, default: 0,     null: false
    t.integer  "customer_id",  limit: 4,                                null: false
    t.datetime "created_date",                                          null: false
  end

  create_table "d_product", primary_key: "product_id", force: :cascade do |t|
    t.string   "product_name",        limit: 255,                                null: false
    t.string   "product_code",        limit: 50
    t.string   "product_description", limit: 255
    t.decimal  "price",                           precision: 10, default: 0,     null: false
    t.decimal  "price_special",                   precision: 10, default: 0,     null: false
    t.integer  "in_stock",            limit: 1,                  default: 0,     null: false
    t.boolean  "is_active",                                      default: true,  null: false
    t.boolean  "del_flg",                                        default: false, null: false
    t.datetime "created_date",                                                   null: false
    t.datetime "modified_date",                                                  null: false
    t.integer  "created_by",          limit: 4,                                  null: false
    t.integer  "modified_by",         limit: 4,                                  null: false
  end

  create_table "d_supplier", primary_key: "supplier_id", force: :cascade do |t|
    t.string   "supplier_name", limit: 255,                 null: false
    t.boolean  "del_flg",                   default: false, null: false
    t.datetime "created_date",                              null: false
    t.datetime "modified_date",                             null: false
    t.integer  "created_by",    limit: 4,                   null: false
    t.integer  "modified_by",   limit: 4,                   null: false
  end

  create_table "t_unit", primary_key: "unit_id", force: :cascade do |t|
    t.string   "unit_name",     limit: 20,                 null: false
    t.boolean  "del_flg",                  default: false, null: false
    t.datetime "created_date",                             null: false
    t.datetime "modified_date",                            null: false
    t.integer  "created_by",    limit: 4,                  null: false
    t.integer  "modified_by",   limit: 4,                  null: false
  end

end
