class UserRegistration < ActionMailer::Base
  default from: "no-replay@comitydesigns.com"
  
  def create_password user
    @recipient = user
    @token = user.usertoken.security_token
    mail :to => user.email, :subject => 'Timesheet New Password'
  end
end
