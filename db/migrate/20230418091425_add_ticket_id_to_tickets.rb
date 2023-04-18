class AddTicketIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :ticket_id, :integer
  end
end
