class ChangeToOtherEmailsToAllowNullInTicketsTable < ActiveRecord::Migration[7.0]
  def change
 		change_column_null :tickets, :cc_emails, true
		change_column_null :tickets, :fwd_emails, true
		change_column_null :tickets, :reply_cc_emails, true
		change_column_null :tickets, :ticket_cc_emails, true
		change_column_null :tickets, :fr_escalated, true
		change_column_null :tickets, :spam, true
		change_column_null :tickets, :is_escalated, true
		change_column_null :tickets, :custom_fields, true
	end
end
