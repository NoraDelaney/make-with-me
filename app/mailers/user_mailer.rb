class UserMailer < ApplicationMailer
  def new_vote(user, voter)
    @user = user
    @voter = voter
    subject = "You are someone's favorite!"
    mail(to: user.email, subject: subject)
  end
end
