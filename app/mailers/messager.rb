class Messager < ActionMailer::Base
 default :from => "Expert_M" 

 def to_admin(feedback)
  @feedback = feedback

  location = Location.first
  admin_email = location.email
  
  #admin_email = 'pop-corm2@ya.ru'
  mail(:to => admin_email, :subject => "Feedback")  
 end

 def to_guest(feedback)
   guest_email = feedback.email
   mail(:to=>guest_email, :subject => "Feedback")
 end

end
