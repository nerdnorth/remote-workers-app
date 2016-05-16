require 'date'

class ChargebeeWebhookController < ApplicationController
  skip_before_action :authenticate_user
  protect_from_forgery with: :null_session

  def handle_webhook
    # Getting the json content from the request.
    body = request.body.string

    # Assigning the recieved content to ChargeBee Event object.
    event =  ChargeBee::Event.deserialize(body)

    if event.event_type == "subscription_created"
      event_id = event.id
      invoice_id = event.content.invoice.id
      subscription_id = event.content.subscription.id
      plan_id = event.content.subscription.plan_id
      customer_id = event.content.customer.id
      customer_email = event.content.customer.email
      start_date = DateTime.strptime(event.content.subscription.current_term_start.to_s, '%s')
      end_date = DateTime.strptime(event.content.subscription.current_term_end.to_s, '%s')

      ChargebeeSubscription.create!(event_id: event_id, invoice_id: invoice_id, subscription_id: subscription_id, customer_id: customer_id, customer_email: customer_email,
          plan_id: plan_id, start_date: start_date, end_date: end_date)
    end

    render json: {status: "ok"}
  end

end
