class SessionsController < Devise::SessionsController
  
  def new
    super
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user != nil
      self.resource = warden.authenticate!(auth_options)
      sign_in @user
      
      redirect_to root_path
      end
    end
end