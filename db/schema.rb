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

ActiveRecord::Schema.define(version: 2019_01_22_023412) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "zip"
    t.string "address"
    t.date "since_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "branch_staffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "staff_id"
    t.bigint "branch_id"
    t.string "title"
    t.date "assigned_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_staffs_on_branch_id"
    t.index ["staff_id"], name: "index_branch_staffs_on_staff_id"
  end

  create_table "branches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "branch_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_branches_on_customer_id"
  end

  create_table "casefiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "year"
    t.integer "number"
    t.date "date"
    t.string "event_title"
    t.integer "event_number"
    t.integer "count"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_casefiles_on_project_id"
  end

  create_table "customer_agents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["agent_id"], name: "index_customer_agents_on_agent_id"
    t.index ["customer_id"], name: "index_customer_agents_on_customer_id"
  end

  create_table "customer_casefiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "casefile_id"
    t.string "applicant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["casefile_id"], name: "index_customer_casefiles_on_casefile_id"
    t.index ["customer_id"], name: "index_customer_casefiles_on_customer_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana"
    t.string "type"
    t.date "birthday"
    t.date "establishment"
    t.string "company_number"
    t.integer "fiscal_year"
    t.date "next_application"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_customers_on_type"
  end

  create_table "identifies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.string "ident_method"
    t.datetime "date_time"
    t.string "place"
    t.string "item"
    t.string "photo"
    t.string "number"
    t.date "issuance_date"
    t.date "expiration_date"
    t.string "publisher"
    t.date "ident_receipt"
    t.boolean "original_copy"
    t.date "send_date"
    t.date "document_receipt"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_identifies_on_customer_id"
    t.index ["user_id"], name: "index_identifies_on_user_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "application_date"
    t.string "place"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "branches", "customers"
  add_foreign_key "casefiles", "projects"
  add_foreign_key "customer_casefiles", "casefiles"
  add_foreign_key "customer_casefiles", "customers"
  add_foreign_key "identifies", "customers"
  add_foreign_key "identifies", "users"
end
