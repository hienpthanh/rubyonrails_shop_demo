class ApplicationController < ActionController::Base
	helper ApplicationHelper
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	Limit_Per_Page = 30
	Limit_Product_Homepage = 10
end
