class Ticket < ApplicationRecord
	self.inheritance_column = nil
	self.primary_key = 'ticket_id'
end

