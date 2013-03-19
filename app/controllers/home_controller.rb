class HomeController < ApplicationController
  # This does not look right...
  skip_before_filter :authenticate

  def index
  end

  def dashboard
  end
end
