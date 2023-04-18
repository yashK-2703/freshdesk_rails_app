class AddAssociatedTicketsCountToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :associated_tickets_count, :integer
  end
end
