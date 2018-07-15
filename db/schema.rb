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

ActiveRecord::Schema.define(version: 20180715015710) do

  create_table "invoice_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "invoice_id", null: false
    t.integer "amount", null: false
    t.boolean "paid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_payments_on_invoice_id"
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id", null: false
    t.string "to_email", null: false
    t.string "project_name"
    t.string "description"
    t.string "invoice_type", default: "once", null: false
    t.integer "total_cost", null: false
    t.string "status", default: "unpaid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sender_name"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "role", default: "user", null: false
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "invoice_payments", "invoices"
  add_foreign_key "invoices", "users"
end
