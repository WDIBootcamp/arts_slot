class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def audition_invite(user)
    @user = user
    mail(to: @user.email, subject: "You're wanted for an audition!")
  end


end
