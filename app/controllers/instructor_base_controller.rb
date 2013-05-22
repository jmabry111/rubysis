class InstructorBaseController < ApplicationController
  skip_before_filter :authenticate_admin!
  before_filter :authenticate_teacher!
  
  helper_method :has_all_grades?
end