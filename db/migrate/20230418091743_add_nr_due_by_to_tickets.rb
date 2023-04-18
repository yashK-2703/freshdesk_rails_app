class AddNrDueByToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :nr_due_by, :datetime
  end
end
