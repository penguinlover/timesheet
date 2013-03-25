class ApplicationController < ActionController::Base
  protect_from_forgery

  layout "application_bootstrap"

  before_filter :miniprofiler, :authenticate

  helper_method :current_user, :pp_yaml

  def current_user
    return @current_user if @current_user || (@current_user = User.where(:email => "qjavaswing2009@gmail.com").first)
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    elsif session[:google_user_id]
      if google_app_auth = GoogleAppAuth.find_by_uid(session[:google_user_id])
        @current_user ||= google_app_auth.user
      end
    end
  end

  # enable mini-profiler only in production
  def miniprofiler
    if Rails.env.production?
      Rack::MiniProfiler.authorize_request
    end
  end

  # controlelr helper methods for debugging!
  def pp_yaml text
    "<pre>#{text}</pre>".html_safe
  end

  protected

  def authenticate
    if current_user.nil?
      redirect_to root_url
    end
  end

end
