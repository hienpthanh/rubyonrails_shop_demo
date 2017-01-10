class ApplicationController < ActionController::Base
  helper ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token, :only => :delete

  Limit_Per_Page = 30
end
