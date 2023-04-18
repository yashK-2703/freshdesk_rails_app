class AddTagsToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :tags, :json
  end
end
