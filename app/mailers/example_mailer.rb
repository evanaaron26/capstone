class ExampleMailer < ApplicationMailer
  default from: 'aaronrabinovitz@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'You Have A New Document')
  end
end
