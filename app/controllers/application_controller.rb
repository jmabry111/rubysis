class ApplicationController < ActionController::Base
  before_filter :authenticate_admin!
  include ApplicationHelper
  helper_method :current_year
  protect_from_forgery
  

end
