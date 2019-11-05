module UsersHelper
  def match_current_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      flash[:alert] = "Page non accessible."
      redirect_to root_path
    end
  end
end
