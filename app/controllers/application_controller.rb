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

  def search 
    if params[:search]
      @members = Member.full_text_search params[:search]
      @events = Event.full_text_search params[:search]
    end
    render 'shared/search_results'
  end

  def auto_complete
    members = Member.full_text_search params[:text]
    arr = []
    for member in members
      arr << member.full_name
    end
    render json: arr
  end
end
