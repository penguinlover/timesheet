require 'bcrypt'
class User < ActiveRecord::Base
  has_one :google_app_auth, :dependent => :destroy
  has_one :usertoken

  attr_accessor :password
  attr_accessible :firstname, :lastname, :company, :phone, :email, :password, :password_confirmation  

  validates :password, :on => :update, :presence => true, :confirmation => true

  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save :encrypt_password, :if => 'password.present?'

  def self.add_google_app_auth attrs
    if user = User.find_by_email(attrs[:email])
      # user exists, just create google_app_auth
      if google_app_user = user.google_app_auth
        google_app_user
      else
        user.create_google_app_auth! :provider => 'google app', :uid => attrs[:uid]
      end
    else
      user = User.create!(
        :email      => attrs[:email], 
        :firstname => attrs[:firstname], 
        :lastname  => attrs[:lastname]
      )
      user.create_google_app_auth! :provider => 'google app', :uid => attrs[:uid]
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def full_name
    if lastname && firstname
      "#{firstname}, #{lastname}"
    end
  end 

  def send_create_password_email
    # create a security token for this user
    self.create_usertoken!
    UserRegistration.create_password(self).deliver
  end

  def delete_token
    self.usertoken.delete
  end
end
