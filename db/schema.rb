# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_18_104420) do
  create_table "conversations", force: :cascade do |t|
    t.text "body"
    t.text "body_text"
    t.integer "conversation_id"
    t.boolean "incoming"
    t.boolean "private"
    t.integer "user_id"
    t.string "support_email"
    t.integer "source"
    t.integer "category"
    t.string "from_email"
    t.text "to_emails"
    t.text "cc_emails"
    t.text "bcc_emails"
    t.integer "email_failure_count"
    t.text "outgoing_failures"
    t.integer "thread_id"
    t.integer "thread_message_id"
    t.datetime "last_edited_at"
    t.integer "last_edited_user_id"
    t.text "attachments"
    t.integer "automation_id"
    t.integer "automation_type_id"
    t.boolean "auto_response"
    t.integer "ticket_id", null: false
    t.text "source_additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_conversations_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.json "cc_emails", default: []
    t.json "fwd_emails", default: []
    t.json "reply_cc_emails", default: []
    t.json "ticket_cc_emails", default: []
    t.boolean "fr_escalated", default: false
    t.boolean "spam", default: false
    t.integer "email_config_id"
    t.integer "group_id"
    t.integer "priority"
    t.integer "requester_id"
    t.integer "responder_id"
    t.integer "source"
    t.integer "company_id"
    t.integer "status"
    t.string "subject"
    t.string "association_type"
    t.string "support_email"
    t.json "to_emails", default: []
    t.integer "product_id"
    t.string "type"
    t.datetime "due_by"
    t.datetime "fr_due_by"
    t.boolean "is_escalated", default: false
    t.json "custom_fields", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id"
    t.integer "associated_tickets_count"
    t.json "tags"
    t.datetime "nr_due_by"
    t.boolean "nr_escalated"
  end

  add_foreign_key "conversations", "tickets", on_delete: :cascade
end
