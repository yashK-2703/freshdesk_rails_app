class ChangeToEmailsToAllowNullInTicketsTable < ActiveRecord::Migration[7.0]
	def change
		change_column_null :tickets, :to_emails, true
	end
end
