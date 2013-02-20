class RegistrationController < ApplicationController
  def new_password
    if Usertoken.exists?(params[:security_token])
      @user = Usertoken.find_by_security_token!(params[:security_token]).user
    else
      render :file => "public/404.html", :status => :not_found
    end
  end

  def create_password
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      session[:user_id] = @user.id
      @user.delete_token
      redirect_to root_path, notice: 'Password successfully created.'
    else
      render :new_password
    end
  end

end
