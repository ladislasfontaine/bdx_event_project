class UserMailer < ApplicationMailer
  default from: 'no-reply@bdx-event.com'

  def welcome_email(user)
    @user = user
    @url = 'http://bdx-event.com/login'

    mail(to: @user.email, subject: 'Bienvenue chez BDX EVENT ! 🤙')
  end
end
