class TeachersController < ApplicationController

  def index
    @teachers = Teacher.order(:name).page(params[:page])
  end
  
end