class UsersController < ApplicationController
  include UsersHelper
  
  before_action :authenticate_user!
  before_action :match_current_user

  def show
    @user = User.find(params[:id])
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
