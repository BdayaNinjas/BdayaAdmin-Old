class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_member!

  # before_filter :check_form

  # def check_form
  # 	if params[:action] == "index"
  # 		@object = (Object.const_get params[:controller].classify).new
  # 	end
  # 	logger.error "\n\n\n\n\n\n\n\n\n\n\n\n\n"
  # 	logger.error @object.to_json

  # end
end
