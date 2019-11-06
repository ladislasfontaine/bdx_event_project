class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @event = Event.find(params[:event_id])
    @participants = @event.users    
  end

  def new
    @event = Event.find(params[:event_id])
  end
  
  def create
    @event = Event.find(params[:event_id])  
    
    if @event.is_free?
      Attendance.create(user: current_user, event: @event)
      flash[:notice] = "Inscription réussie. Bravo."
      redirect_to event_path(params[:event_id])
    else
      # Amount in cents
      @amount = @event.price.to_i * 100
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

      if charge["paid"] == true
        #Save customer to the db
        Attendance.create(user: current_user, event: @event, stripe_customer_id: customer.id)
        flash[:notice] = "Paiement réussi. Bravo."
        redirect_to event_path(params[:event_id])
      end
    end

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_event_participation_path(params[:event_id])
        
  end
end
