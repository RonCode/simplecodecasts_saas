class ContactMailer < ActionMailer::Base
  default to: 'iamtheone500@yahoo.com'
  
  def contact_email(name, email, body)
    @name = name
    @emal = email
    @body = body
    
    mail(from: email, subject: 'Contact Form Message')
  end
end