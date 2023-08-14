class SessionsController < Devise::SessionsController
  
  def new
    super
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.approve?
      self.resource = warden.authenticate!(auth_options)
      sign_in @user
    
      redirect_to root_path

    else
      flash[:alert] = 'User not approved Please contact Admin'
    end
      redirect_to new_user_session_path
  end

end