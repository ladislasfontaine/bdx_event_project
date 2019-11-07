class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.user

    # if current_user == @creator
    # if @event.users.include?(current_user)
  end

  def new
  end

  def create
    @event = Event.new(title: params[:title], location: params[:location], start_date: params[:start_date], duration: params[:duration].to_i, description: params[:description], price: params[:price].to_i, user: current_user)
    if @event.save && params[:cover]
      @event.cover.attach(params[:cover])
      flash[:notice] = "Évènement créé."
      redirect_to event_path(@event.id)
    else
      flash[:alert] = "Erreur. Essaye encore."
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])    
  end

  def update
    @event = Event.find(params[:id])
    if params[:cover] != ""
      @event.cover.attach(params[:cover])      
    end
    if @event.update(title: params[:title], location: params[:location], start_date: params[:start_date], duration: params[:duration].to_i, description: params[:description], price: params[:price].to_i, user: current_user)
      flash[:notice] = "Ton évènement a bien été modifié."
      redirect_to event_path(params[:id])
    else
      flash[:alert] = "Ton évènement n'a pas pu être modifié."
      redirect_to edit_event_path(params[:id])
    end
  end

  def destroy
    @event = Event.find(params[:id])    
    if @event.destroy
      flash[:notice] = "Ton évènement a bien été supprimé."
      redirect_to root_path
    else
      flash[:alert] = "Problème. Ton évènement n'a pas pu être supprimé."
      redirect_to edit_event_path(params[:id])
    end
  end
end
