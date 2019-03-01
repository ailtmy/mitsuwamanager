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

ActiveRecord::Schema.define(version: 2019_03_01_073420) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "zip"
    t.string "address"
    t.date "since_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address_kind"
    t.boolean "address_closure"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "apart_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "apart_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apart_id"], name: "index_apart_rooms_on_apart_id"
    t.index ["room_id"], name: "index_apart_rooms_on_room_id"
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
    t.string "kind"
    t.index ["project_id"], name: "index_casefiles_on_project_id"
  end

  create_table "certificates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cert_kind"
    t.integer "number_sheet"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "window", default: false
    t.index ["project_id"], name: "index_certificates_on_project_id"
  end

  create_table "company_controls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "control_id"
    t.string "control_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.date "date"
    t.string "category"
    t.string "pay_org"
    t.string "pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_costs_on_project_id"
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

  create_table "destinates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.date "send_date"
    t.string "send_addr"
    t.string "send_number"
    t.boolean "receive_doc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "send_method", default: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_destinates_on_customer_id"
    t.index ["project_id"], name: "index_destinates_on_project_id"
  end

  create_table "estate_units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "estate_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estate_id"], name: "index_estate_units_on_estate_id"
    t.index ["unit_id"], name: "index_estate_units_on_unit_id"
  end

  create_table "estates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type"
    t.string "estate_number"
    t.string "address"
    t.string "number"
    t.string "estate_kind"
    t.text "area"
    t.string "structure"
    t.string "apart_name"
    t.string "apart_structure"
    t.text "apart_area"
    t.integer "sign"
    t.string "land_percent"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "control_id"
    t.index ["control_id"], name: "index_estates_on_control_id"
    t.index ["type"], name: "index_estates_on_type"
  end

  create_table "gifts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "send_receive"
    t.string "gift_kind"
    t.integer "gift_year"
    t.string "gift_address"
    t.text "gift_remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_gifts_on_customer_id"
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

  create_table "mails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "mailable_type"
    t.bigint "mailable_id"
    t.string "mail_address"
    t.string "mail_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mailable_type", "mailable_id"], name: "index_mails_on_mailable_type_and_mailable_id"
  end

  create_table "mistakes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "category"
    t.integer "project_id"
    t.string "title"
    t.text "content"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mistakes_on_user_id"
  end

  create_table "mitsuwa_docs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "kind"
    t.text "content"
    t.bigint "user_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mitsuwa_docs_on_user_id"
  end

  create_table "prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "year"
    t.integer "price"
    t.bigint "estate_id"
    t.string "price_kind"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estate_id"], name: "index_prices_on_estate_id"
  end

  create_table "project_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "customer_id"
    t.string "position"
    t.string "equity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_project_customers_on_customer_id"
    t.index ["project_id"], name: "index_project_customers_on_project_id"
  end

  create_table "project_estates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "estate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estate_id"], name: "index_project_estates_on_estate_id"
    t.index ["project_id"], name: "index_project_estates_on_project_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "application_date"
    t.string "place"
    t.string "status"
    t.datetime "place_date"
    t.boolean "tax_reduction"
    t.string "tax_document"
    t.boolean "loan"
    t.integer "loan_price"
    t.datetime "loan_agree"
    t.boolean "loan_document"
    t.boolean "change_name"
    t.string "change_name_doc"
    t.boolean "erasure"
    t.boolean "erasure_confirm"
    t.date "complete_date"
    t.bigint "user_id"
    t.boolean "report"
    t.text "request_content"
    t.text "remarks"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_projects_on_type"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "sites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "land_id"
    t.string "land_kind"
    t.string "land_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign"
    t.index ["land_id"], name: "index_sites_on_land_id"
    t.index ["room_id"], name: "index_sites_on_room_id"
  end

  create_table "tels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "telable_type"
    t.bigint "telable_id"
    t.string "tel_number"
    t.string "tel_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["telable_type", "telable_id"], name: "index_tels_on_telable_type_and_telable_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "branches", "customers"
  add_foreign_key "casefiles", "projects"
  add_foreign_key "certificates", "projects"
  add_foreign_key "costs", "projects"
  add_foreign_key "customer_casefiles", "casefiles"
  add_foreign_key "customer_casefiles", "customers"
  add_foreign_key "destinates", "projects"
  add_foreign_key "estates", "controls"
  add_foreign_key "gifts", "customers"
  add_foreign_key "identifies", "customers"
  add_foreign_key "identifies", "users"
  add_foreign_key "mistakes", "users"
  add_foreign_key "mitsuwa_docs", "users"
  add_foreign_key "prices", "estates"
  add_foreign_key "project_customers", "customers"
  add_foreign_key "project_customers", "projects"
  add_foreign_key "project_estates", "estates"
  add_foreign_key "project_estates", "projects"
end
