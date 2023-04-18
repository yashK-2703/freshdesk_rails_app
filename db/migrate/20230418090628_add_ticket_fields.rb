# db/migrate/<timestamp>_add_ticket_fields.rb

class AddTicketFields < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.json :cc_emails, null: false, default: []
      t.json :fwd_emails, null: false, default: []
      t.json :reply_cc_emails, null: false, default: []
      t.json :ticket_cc_emails, null: false, default: []
      t.boolean :fr_escalated, null: false, default: false
      t.boolean :spam, null: false, default: false
      t.integer :email_config_id
      t.integer :group_id
      t.integer :priority
      t.integer :requester_id
      t.integer :responder_id
      t.integer :source
      t.integer :company_id
      t.integer :status
      t.string :subject
      t.string :association_type
      t.string :support_email
      t.json :to_emails, null: false, default: []
      t.integer :product_id
      t.string :type
      t.datetime :due_by
      t.datetime :fr_due_by
      t.boolean :is_escalated, null: false, default: false
      t.json :custom_fields, null: false, default: {}
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end

