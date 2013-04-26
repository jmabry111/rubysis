class SemestersController < ApplicationController
  
  def new
    find_school_year
    @semester = Semester.new
    @semester.grading_periods.build
  end
  
  def create
    find_school_year
    @semester = Semester.create(semester_params)
    
    if @semester.save
      redirect_to school_year_path(@school_year), notice: "Semester created"
    else
      render 'new'
    end
  end
  
  def show
    @semester = Semester.find(params[:id])
    @grading_periods = @semester.grading_periods.page(params[:page])
  end

  
  
  private
  
  def find_school_year
    @school_year = SchoolYear.find(params[:school_year_id])
  end
  
  def semester_params
    params.require(:semester).permit(:description, :starts_on, :ends_on, :school_year_id)
  end
end
