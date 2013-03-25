# BaseController defines common behavior among all API's
module Api
  class BaseController < ApplicationController
    respond_to :json
    skip_before_filter :authenticate
  end
end