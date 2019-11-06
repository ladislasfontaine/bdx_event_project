class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.user
  end

  def new
  end

  def create
    @event = Event.new(title: params[:title], location: params[:location], start_date: DateTime.parse(params[:start_date] + ' ' + params[:start_time] + ':00'), duration: params[:duration].to_i, description: params[:description], price: params[:price].to_i, user: current_user)
    @event.save
    redirect_to event_path(@event.id)
  end
end
