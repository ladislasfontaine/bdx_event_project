class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    # on vérifie s'il y a un paramètre avatar pour pas envoyer d'erreur si pas d'avatar
    if params[:avatar]
      @user.avatar.attach(params[:avatar])
    else
      flash[:alert] = "Pas de changement de photo de profil."     
    end
    redirect_to(user_path(@user))
  end
end
