class ListingsNotifier < ActionMailer::Base
  default from: "cloydster@gmail.com"

  def listings_email(user)
    mail( to: user.email,
          subject: "You've got new listings!" )
  end

  def listings_text(user)
    
    mail( to: user.text_address,
          subject: "HouseMe Results",
          body: "You have new results waiting for you!" )
  end

end