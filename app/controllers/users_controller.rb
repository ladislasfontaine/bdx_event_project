class UsersController < ApplicationController
  include UsersHelper
  
  before_action :authenticate_user! #, except: [:index]
  before_action :match_current_user #, except: [:index]

  # def index
  #   redirect_to root_path  
  # end

  def show
    @user = User.find(params[:id])
    @events = Event.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
    redirect_to @user
  end
end
