# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150903211548) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "currency_id",       limit: 4
    t.integer  "plutus_account_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "code",          limit: 255
    t.decimal  "exchange_rate",             precision: 20, scale: 10
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "type",            limit: 255
    t.integer  "account_id",      limit: 4
    t.integer  "currency_id",     limit: 4
    t.integer  "category_id",     limit: 4
    t.integer  "plutus_entry_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "plutus_accounts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.boolean  "contra",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_accounts", ["name", "type"], name: "index_plutus_accounts_on_name_and_type", using: :btree

  create_table "plutus_amounts", force: :cascade do |t|
    t.string  "type",       limit: 255
    t.integer "account_id", limit: 4
    t.integer "entry_id",   limit: 4
    t.decimal "amount",                 precision: 20, scale: 10
  end

  add_index "plutus_amounts", ["account_id", "entry_id"], name: "index_plutus_amounts_on_account_id_and_entry_id", using: :btree
  add_index "plutus_amounts", ["entry_id", "account_id"], name: "index_plutus_amounts_on_entry_id_and_account_id", using: :btree
  add_index "plutus_amounts", ["type"], name: "index_plutus_amounts_on_type", using: :btree

  create_table "plutus_entries", force: :cascade do |t|
    t.string   "description",              limit: 255
    t.integer  "commercial_document_id",   limit: 4
    t.string   "commercial_document_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_entries", ["commercial_document_id", "commercial_document_type"], name: "index_entries_on_commercial_doc", using: :btree

end
