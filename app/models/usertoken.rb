class Usertoken < ActiveRecord::Base  
  belongs_to :user
  
  before_create :generate_security_token
  
  def self.exists? token
    where(:security_token => token).exists?
  end
  
  protected 
    def generate_security_token
      begin
        token = SecureRandom.urlsafe_base64
      end while Usertoken.where(:security_token => token).exists?
      self.security_token = token
    end
end
