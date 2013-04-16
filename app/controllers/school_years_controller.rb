class SchoolYearsController < ApplicationController
  
  def new
    @school_year = SchoolYear.new
    @school_year.semesters.build
  end
  
  def create
    @school_year = SchoolYear.create(school_year_params)
    
    if @school_year.save
      redirect_to school_year_path(@school_year), notice: "Year created"
    else
      render 'new'
    end
  end
  
  def show
    @school_year = SchoolYear.find_by_id(params[:id])
    @semesters = @school_year.semesters.page(params[:page])
  end
  
  def index
    @school_years = SchoolYear.order(:starts_on).page(params[:page])
  end
  
  
  private
  def school_year_params
    params.require(:school_year).permit(:description, :ends_on, :starts_on)
  end
end
