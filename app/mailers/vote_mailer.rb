class VoteMailer < ApplicationMailer
  def new_vote(vote)
    @vote = vote
    subject = "You are someone's favorite!"
    mail(to: vote.user.email, subject: subject)
  end
end
