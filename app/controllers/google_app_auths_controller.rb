class GoogleAppAuthsController < ApplicationController
  def create
    res = request.env['omniauth.auth']
    if res[:uid]
      uid = res[:uid].match(/id=(\d+)$/i)[1]
      email = res[:info][:email]
      first_name = res[:info][:first_name]
      last_name  = res[:info][:last_name]

      google_app_user = User.add_google_app_auth(
        :email => email, 
        :firstname => first_name, 
        :lastname => last_name, 
        :uid => uid
      )

      # create session using google app uid
      session[:google_user_id] = google_app_user.uid

      redirect_to root_path, :notice => 'Successfully logged in.'
      #render :text => pp_yaml(res.to_yaml)
    else
      render :file => 'public/500.html'
    end
  end

  def failure
    redirect_to root_path, alert: 'Authentication failed, please try again!'
  end
end
