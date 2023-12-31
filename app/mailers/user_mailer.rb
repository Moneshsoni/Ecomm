class UserMailer < ApplicationMailer
  
  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirm your account')
  end
end
