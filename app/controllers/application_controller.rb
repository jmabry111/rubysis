class ApplicationController < ActionController::Base
  before_filter :authenticate_admin!
  include ApplicationHelper
  helper_method :current_year
  helper_method :next_year
  helper_method :current_semester
  helper_method :next_semester
  helper_method :current_grading_period
  protect_from_forgery
  

  protected
  
  def current_year
    @current_year ||= SchoolYear.where("starts_on < ? AND ends_on > ?", Time.now, Time.now).first.to_s
  end
  def next_year
    @next_year ||= SchoolYear.where("starts_on < ? AND ends_on > ?", Time.now + 1.year, Time.now + 1.year).first.to_s
  end
  
  
  def current_semester
     @current_semester ||= Semester.where("starts_on < ? AND ends_on > ?", Time.now, Time.now).first
  end
  def next_semester
    @next_semester ||= Semester.where("starts_on < ? AND ends_on > ?", Time.now + 6.months, Time.now + 6.months).first
    if @next_semester != nil
      return @next_semester
    else
      return current_semester
    end
  end
  
  def current_grading_period
     @current_grading_period ||= GradingPeriod.where("starts_on < ? AND ends_on > ?", Time.now + 4.months, Time.now + 4.months).first
  end
end
