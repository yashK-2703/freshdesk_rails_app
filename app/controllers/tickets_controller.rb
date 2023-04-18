class TicketsController < ApplicationController
	def index
		@tickets = Ticket.all # Retrieve all tickets from the database
		render 'tickets/index' # Render the view file located at app/views/tickets/index.html.erb
	end

	def fetch_tickets
		response = HTTParty.get(
			'https://metricare.freshdesk.com/api/v2/tickets',
			basic_auth: {
				username: 'j6NM91cUFfJAUotHhZR',
				password: 'X'
			},
			headers: {
				'Content-Type' => 'application/json'
			}
		)

			if response.success?
				tickets = JSON.parse(response.body)

				tickets.each do |ticket|
					existing_ticket = Ticket.find_by(ticket_id: ticket['id'])

					if existing_ticket
						existing_ticket.update!(
							cc_emails: ticket['cc_emails'],
							fwd_emails: ticket['fwd_emails'],
							reply_cc_emails: ticket['reply_cc_emails'],
							ticket_cc_emails: ticket['ticket_cc_emails'],
							fr_escalated: ticket['fr_escalated'],
							spam: ticket['spam'],
							email_config_id: ticket['email_config_id'],
							group_id: ticket['group_id'],
							priority: ticket['priority'],
							requester_id: ticket['requester_id'],
							responder_id: ticket['responder_id'],
							source: ticket['source'],
							company_id: ticket['company_id'],
							status: ticket['status'],
							subject: ticket['subject'],
							association_type: ticket['association_type'],
							support_email: ticket['support_email'],
							to_emails: ticket['to_emails'],
							product_id: ticket['product_id'],
							type: ticket['type'],
							due_by: ticket['due_by'],
							fr_due_by: ticket['fr_due_by'],
							is_escalated: ticket['is_escalated'],
							custom_fields: ticket['custom_fields'],
							created_at: ticket['created_at'],
							updated_at: ticket['updated_at'],
							associated_tickets_count: ticket['associated_tickets_count'],
							tags: ticket['tags'],
							nr_due_by: ticket['nr_due_by']
						)
					else
						Ticket.create!(
							cc_emails: ticket['cc_emails'],
							fwd_emails: ticket['fwd_emails'],
							reply_cc_emails: ticket['reply_cc_emails'],
							ticket_cc_emails: ticket['ticket_cc_emails'],
							fr_escalated: ticket['fr_escalated'],
							spam: ticket['spam'],
							email_config_id: ticket['email_config_id'],
							group_id: ticket['group_id'],
							priority: ticket['priority'],
							requester_id: ticket['requester_id'],
							responder_id: ticket['responder_id'],
							source: ticket['source'],
							company_id: ticket['company_id'],
							status: ticket['status'],
							subject: ticket['subject'],
							association_type: ticket['association_type'],
							support_email: ticket['support_email'],
							to_emails: ticket['to_emails'],
							product_id: ticket['product_id'],
							ticket_id: ticket['id'],
							type: ticket['type'],
							due_by: ticket['due_by'],
							fr_due_by: ticket['fr_due_by'],
							is_escalated: ticket['is_escalated'],
							custom_fields: ticket['custom_fields'],
							created_at: ticket['created_at'],
							updated_at: ticket['updated_at'],
							associated_tickets_count: ticket['associated_tickets_count'],
							tags: ticket['tags'],
							nr_due_by: ticket['nr_due_by']
						)
					end
				end

				flash[:success] = 'Tickets fetched successfully!'
			else
				flash[:error] = 'Unable to fetch tickets'
			end
		redirect_to tickets_path
	end
end

