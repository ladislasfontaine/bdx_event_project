class UserMailer < ApplicationMailer
  default from: 'no-reply@bdx-event.com'

  def welcome_email(user)
    @user = user
    @url = 'http://bdx-event.com/login'

    mail(to: @user.email, subject: 'Bienvenue chez BDX EVENT ! 🤙')
  end

  def new_participant(attendance)
    # on récupère l'élément attendance et on crée les variables à utiliser dans le mail
    @attendance = attendance
    @event = @attendance.event
    @creator = @event.user
    @participant = @attendance.user

    mail(to: @creator.email, subject: 'Nouveau participant à ton évènment 👏')
  end
end
