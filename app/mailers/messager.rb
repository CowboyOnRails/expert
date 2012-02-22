# encoding: UTF-8
class Messager < ActionMailer::Base
 default :from => "Expert_M" 

 def to_admin(feedback)
  @feedback = feedback

  location = Location.first
  admin_email = location.email
  
  #admin_email = 'pop-corm2@ya.ru'
  mail(:to => admin_email, :subject => subject)  
 end

 def to_guest(feedback)
   guest_email = feedback.email
   
   mail(:to=>guest_email, :subject => subject)
 end

 def subject
   sitename = Location.first.sitename
   subject = sitename.present? ? sitename : "Обратная связь"
 end

end
