class AddNrEscalatedToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :nr_escalated, :boolean
  end
end
