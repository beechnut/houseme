class SignupNotifier < ActionMailer::Base
  default from: "cloydster@gmail.com"

  def signup_email(user)
    mail( to: user.email,
          subject: "Thanks for signing up!",
          body: "Hi, and welcome to HouseMe!" )
  end

  def signup_text(user)
    mail( to: user.text_address,
          subject: "Welcome text",
          body: "Did you get this text?" )
  end

end