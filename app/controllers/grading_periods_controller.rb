class GradingPeriodsController < ApplicationController
  
  def new
    @semester = Semester.find(params[:semester_id])
    @grading_period = GradingPeriod.new
    
  	puts @semester.description
  end
  
  def create
    @semester = Semester.find(params[:semester_id])
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
  
  def grading_period_params
    params.require(:grading_period).permit(:description, :ends_on, :semester_id, :starts_on)
  end
end
