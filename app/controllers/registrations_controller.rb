class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create 
      # binding.pry
      @user = User.new(user_params)
      @user.skip_confirmation!
      if @user.save
        UserMailer.confirmation_email(@user).deliver_now
        # UserMailer.with(user: @user).confirmation_email.deliver_now
        redirect_to root_path , notice: "User succesfully created!" 
        sign_in @user
      else
        render :new
      end
  end

  def edit
     @user = User.find(@user.id)
  end


  def update
    @user = User.find(@user.id)
    @user.update(user_params)
    sign_in @user
    redirect_to root_path
  end

  def confirm_email
    user = User.find_by(confirmation_token: params[:token])
    if user
      user.update(confirmation_token: nil)
      flash[:notice] = 'Your account has been confirmed. You can now log in.'
      redirect_to welcome_path
    else
      flash[:alert] = 'Invalid confirmation token.'
      redirect_to root_path
    end
  end


  private
  def user_params
   	 params.require(:user).permit(:email,:user_type,:password,:password_confirmation)
   end
end