# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def confirmation_email
    @user = params[:user]
    mail(to: "sonimonesh115@gmail.com", subject: 'Confirm your account')
  end

end
