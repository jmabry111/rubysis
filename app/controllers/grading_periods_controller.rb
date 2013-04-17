class GradingPeriodsController < ApplicationController
  
  def new
    find_semester
    @grading_period = GradingPeriod.new
  end
  
  def create
    find_semester
    @grading_period = GradingPeriod.create(grading_period_params)
    
    if @grading_period.save
      redirect_to semester_path(@semester), notice: "Period created"
    else
      render 'new'
    end
  end
  
  def show
    @grading_period = GradingPeriod.find(params[:id])
  end
  
  
  private
  def find_semester
    @semester = Semester.find(params[:semester_id])
  end
  
  def grading_period_params
    params.require(:grading_period).permit(:description, :ends_on, :semester_id, :starts_on)
  end
end
